-- SQLBook: Code
/*
📈 Price-Based Analysis
	1.	What was the highest “High” price for each stock ticker in 2024?
	2.	Find the day with the largest gap between “Open” and “Close” price for each stock.
	3.	List all days where the “Close” was lower than the “Open” (i.e., stock closed red).
	4.	Calculate the daily percentage change in closing price for each stock.
	5.	Identify the top 5 stocks with the most volatile “High-Low” price difference in 2025.
	6.	Show the top 3 days with the highest gain from “Low” to “Close” for any stock.

⸻

🔄 Volume and Liquidity
	7.	What is the 7-day rolling average of Volume for each ticker?
	8.	Identify any date where a stock’s trading volume was more than double its 30-day average.
	9.	Rank stocks by average trading volume over the last 90 days.
	10.	On which date did each stock have its highest trading volume in the dataset?

⸻

💰 Adjusted Close & Corporate Actions
	11.	Find the average difference between “Close” and “Adjusted Close” for all tickers.
	12.	For each stock, how many days show an adjustment in the closing price due to dividends or splits?
	13.	Find all days where the adjusted close differs significantly (>5%) from the raw close.
	14.	For a given stock, calculate cumulative returns using Adjusted Close prices.

⸻

🎁 Dividends
	15.	List all dates on which dividends were issued, sorted by amount descending.
	16.	Calculate the total dividends issued per stock in each year.
	17.	Identify all dividend payments greater than $2.
	18.	Which stocks issued dividends in every quarter of 2023?

⸻

📉 Stock Splits
	19.	List all stock splits that occurred, with date and ratio.
	20.	Identify any stocks that had more than one split during the dataset period.
	21.	Find the stock with the highest total number of stock splits.

⸻

🏷️ Brands, Tickers & Industry
	22.	Which industry had the highest average capital gains in 2024?
	23.	Find the stock (Brand_Name) that performed best in terms of capital gains.
	24.	Group average Adjusted Close by Industry_Tag per year.
	25.	Count how many stocks each Country has in the dataset.

⸻

🔎 Time Series Trends
	26.	For each stock, find the best performing month (highest average Close price).
	27.	Show the 5 worst performing days (largest negative daily change) in 2023.
	28.	Identify days where more than 5 different stocks issued dividends.

⸻

📉 Rights Offerings & Ticker Changes
	29.	List all tickers that changed over time for the same Brand_Name.
	30.	Identify signs of mergers or delistings by finding Brand_Names with disappearing Tickers.
		Finds all Tickers that existed in 2023 but do not appear in 2025.
*/
USE StockMarket;

-------------------LOOK UP ALL THE COLUMNS, DATE TYPE------------------------------------------
SELECT  COLUMN_NAME,  DATA_TYPE,  CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'StockData' AND TABLE_SCHEMA = 'dbo';


SELECT *  FROM dbo.StockData


--------------------------------------📈 Price-Based Analysis----------------------------------------------
--  1:
SELECT YEAR(Date) AS Year, Brand_Name, 
			MAX(High) AS Highest
FROM dbo.StockData
WHERE YEAR(Date) = 2024
GROUP BY Brand_Name, YEAR(Date) 

--  2:
SELECT t.Brand_Name, t.Date, t.gap
FROM (
    SELECT Brand_Name, Date, ABS([Close] - [Open]) AS gap
    FROM dbo.StockData
) AS t
WHERE t.gap = (
    SELECT MAX(ABS([Close] - [Open]))
    FROM dbo.StockData AS inner_StockData
    WHERE inner_StockData.Brand_Name = t.Brand_Name
)
ORDER BY t.Brand_Name;

--  3: 
SELECT Brand_Name, Date, [Close], [Open]
FROM dbo.StockData
WHERE [Close]< [Open] AND YEAR(DATE) = 2025
ORDER BY Brand_Name, Date

-- 4:
SELECT Brand_Name, Date, [Close], 
		( [Close] - LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) ) * 100.0 
        	/ LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS percentage_change
FROM dbo.StockData
WHERE YEAR(DATE) = 2025 AND Brand_Name = 'apple'
ORDER BY  Date

--  5:
SELECT TOP 5 
    Brand_name,
    MAX(High - Low) AS the_most_volatility
FROM dbo.StockData
WHERE YEAR(Date) = 2025
GROUP BY Brand_name
ORDER BY the_most_volatility DESC;

--  6
--USING ROW_NUMBER
SELECT Brand_Name, Date, Gain
FROM (
    SELECT
        Brand_Name,
        Date,
        [Close] - Low AS Gain,
        ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY [Close] - Low DESC) AS rn
    FROM dbo.StockData
) AS ranked
WHERE rn <= 3
ORDER BY Brand_Name ;
--Method2: Using CROSS APPLY
SELECT s.Brand_Name, s.Date, s.Gain
FROM (
    SELECT DISTINCT Brand_Name FROM dbo.StockData
) b
CROSS APPLY (
    SELECT TOP 3 
        Brand_Name, Date, ([Close] - Low) AS Gain
    FROM dbo.StockData
    WHERE Brand_Name = b.Brand_Name AND YEAR(Date) = 2025
    ORDER BY ([Close] - Low) DESC
) s
ORDER BY s.Brand_Name, s.Gain DESC;



--------------------------------------🔄 Volume and Liquidity----------------------------------------------
--  7:
SELECT
        Brand_Name, Ticker, Date,
         AVG (Volume) OVER (PARTITION BY Ticker  ORDER BY Ticker, Date
     ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) RollingAverageVolume
FROM dbo.StockData
ORDER BY Brand_Name, Ticker, Date

--  8:
SELECT Brand_name,  Date, Volume, RollingAverageVolume FROM (
	SELECT  Brand_name,  Date, Volume,
	AVG(Volume) OVER ( PARTITION BY Brand_name   ORDER BY Date
		ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
	) AS RollingAverageVolume
	FROM dbo.StockData
) AS sq
WHERE Volume > 2 *RollingAverageVolume
ORDER BY Brand_name, Date;

-- 9:
SELECT Brand_name,  DATEADD(DAY, -30, GETDATE()) AS  last_30_days, GETDATE() AS today, AVG(Volume) AS average_valume
FROM dbo.StockData
WHERE CONVERT(date, Date, 120)  BETWEEN DATEADD(DAY, -30, GETDATE()) AND GETDATE()
GROUP BY Brand_name

-- 10. 
-- Method 1: Using LEFT JOIN
SELECT * FROM (
	SELECT sd1.Brand_name,  sd1.Date, sd2.Volume,  MAX(sd1.Volume) OVER(Partition by sd1.Brand_Name) AS highest_volume
	FROM dbo.StockData AS sd1
	LEFT JOIN dbo.StockData AS sd2
	ON sd1.Brand_name= sd2.Brand_name AND sd1.Date=sd2.Date 
) AS sub1
WHERE Volume = highest_volume
ORDER BY Volume DESC
-- Method 2: Using RANK()
SELECT Brand_name,  Date, Volume FROM (
	SELECT Brand_name,  Date, Volume,  RANK() OVER(Partition by Brand_Name ORDER BY  Volume DESC) AS ranking_volume
	FROM dbo.StockData
) AS subq
WHERE ranking_volume = 1 
ORDER BY Volume DESC

--------------------------------------💰 Adjusted Close & Corporate Actions----------------------------------------------

-- 11:
SELECT  Brand_Name, Ticker, AVG([Close] - [Adjusted_Close_Approx]) AS Avg_Close_AdjustedClose_Diff
FROM (
	-- Calculate the Adjuested Close
	SELECT  Brand_Name, Date, Ticker,  [Close], Dividends, [Stock Splits],
	(CASE 
		WHEN [Stock Splits] > 0 THEN ([Close] - Dividends) / [Stock Splits]
		ELSE ([Close] - Dividends)
		END) AS Adjusted_Close_Approx
	FROM dbo.StockData 
) AS sq
GROUP BY  Brand_Name, Ticker
ORDER BY  Avg_Close_AdjustedClose_Diff DESC

--12. 
SELECT Brand_Name, COUNT(*) AS number_of_days
FROM dbo.StockData
WHERE Dividends  IS NOT NULL  AND Dividends !=0 
			OR [Stock Splits] IS NOT NULL  AND [Stock Splits] != 0
GROUP BY Brand_Name
ORDER BY number_of_days DESC

	--check the answer with 'apple'
	SELECT Brand_Name, Date, Dividends, [Stock Splits] 
	FROM dbo.StockData
	WHERE (Dividends !=0 OR [Stock Splits] != 0) AND Brand_Name = 'apple'
	ORDER BY date DESC

-- 13:
SELECT Brand_Name, Date, [Close], Adjusted_Close_Approx, ABS([Close] - Adjusted_Close_Approx) * 100 / [Close] AS Difference_in_Percent
FROM dbo.StockData
WHERE ABS([Close] - Adjusted_Close_Approx) * 100 / [Close] > 5
ORDER BY Brand_Name

-- 14:
	--Method 1: Using Subquery
	SELECT sq.Brand_Name, sd.Date , sq.first_date, sd.Adjusted_Close_Approx, sq.first_adj_closing_price,  
				(sd.Adjusted_Close_Approx- sq.first_adj_closing_price) / sq.first_adj_closing_price AS cumulative_returns_of_Ajd_Close
	FROM(
		-- Choose the first adjusted closing proce as the Original Price 
		SELECT Brand_Name, Adjusted_Close_Approx AS first_adj_closing_price, Date AS first_date,
					ROW_NUMBER() OVER(PARTITION BY Brand_Name ORDER BY Date) AS rn
		FROM dbo.StockData
	) AS sq 
	LEFT JOIN dbo.StockData AS sd
	ON sd.Brand_Name=sq.Brand_Name 
	WHERE sq.rn =1 AND sd.Brand_Name = 'apple'
	ORDER BY sd.Date 

	--Method 2: FIRST_VALUE(...) OVER (...): Gets the first adjusted close price for each stock.
	SELECT  Brand_Name, Date, Adjusted_Close_Approx,
				FIRST_VALUE(Adjusted_Close_Approx) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Initial_Price,
				(Adjusted_Close_Approx / FIRST_VALUE(Adjusted_Close_Approx) 
						OVER (PARTITION BY Brand_Name ORDER BY Date) - 1) * 100 AS Cumulative_Return_Percent
	FROM  dbo.StockData
	WHERE  Brand_Name = 'Apple'
	ORDER BY Date;

--------------------------------------🎁 Dividends----------------------------------------------
--15: 
SELECT  Brand_Name, Date, Dividends
FROM dbo.StockData
WHERE Dividends IS NOT NULL AND Dividends!= 0
ORDER BY Brand_Name, Date

--16:
SELECT  Brand_Name, YEAR(Date) AS year, SUM(Dividends) as total_dividends
FROM dbo.StockData
WHERE Dividends IS NOT NULL AND Dividends!= 0
GROUP BY Brand_Name, YEAR(Date)
ORDER BY Brand_Name,  YEAR(Date)

SELECT  Brand_Name, Date , Dividends
FROM dbo.StockData
WHERE Brand_Name = 'apple' AND YEAR(Date) = 2024 AND Dividends !=0

--17:
SELECT  Brand_Name, Date, Dividends
FROM dbo.StockData
WHERE Dividends IS NOT NULL AND Dividends > 2
ORDER BY Brand_Name, Date

--18:
--This does not optimize the result because if dividends were issued more than once in a quarter 
SELECT  Brand_Name, year , COUNT(Quarter) AS count_quarter FROM (
	SELECT  Brand_Name, 
				YEAR(Date) AS year, DATEPART(QUARTER,Date) AS quarter, Dividends
	FROM dbo.StockData
	WHERE Dividends IS NOT NULL AND Dividends  != 0 AND  YEAR(Date) = 2024 
) AS sq
GROUP BY  Brand_Name, year 
HAVING COUNT(Quarter) = 4

		-- Example: salesforce / slack is the CASE that we need to consider
		SELECT  Brand_Name, Dividends, DATEPART(QUARTER,Date)
		FROM dbo.StockData
		WHERE Brand_Name = 'salesforce / slack' AND Dividends !=0 AND YEAR(Date) = 2024

--This is the correct way and can avoid the above case
SELECT Brand_Name,year, COUNT(*) FROM (
	SELECT  Brand_Name, 
			YEAR(Date) AS year, DATEPART(QUARTER,Date) AS quarter, Dividends,
			ROW_NUMBER() OVER(PARTITION BY Brand_Name ORDER BY DATEPART(QUARTER,Date)) AS rn
	FROM dbo.StockData
	WHERE Dividends IS NOT NULL AND Dividends  != 0 AND  YEAR(Date) = 2024 
) AS sq WHERE quarter = rn
GROUP BY Brand_Name, year
HAVING COUNT(*) = 4

--------------------------------------📉 Stock Splits----------------------------------------------
--19. 
SELECT  Brand_Name, Date, [Stock Splits]
FROM dbo.StockData
WHERE [Stock Splits] != 0
ORDER BY Brand_Name

--20
SELECT  Brand_Name, COUNT([Stock Splits]) number_of_splits
FROM dbo.StockData
WHERE [Stock Splits] != 0
GROUP BY Brand_Name
ORDER BY number_of_splits DESC

--21
SELECT TOP 1 Brand_Name, COUNT(*) AS Split_Occurrences
FROM dbo.StockData
WHERE [Stock Splits] > 0
GROUP BY Brand_Name
ORDER BY Split_Occurrences DESC;

--------------------------------------🏷️ Brands, Tickers & Industry----------------------------------------------

--22. There is no data for Capital Gains
SELECT  TOP 1 Industry_Tag, AVG(Capital_Gain_Est) AS average_capital_gains
FROM dbo.StockData
WHERE YEAR(Date) = 2024
GROUP BY Industry_Tag
ORDER BY average_capital_gains DESC 


-- 23: 
SELECT  TOP 1 Brand_Name, SUM(Capital_Gain_Est) AS average_capital_gains
FROM dbo.StockData
GROUP BY Brand_Name
ORDER BY average_capital_gains DESC 

-- 24: 
SELECT Industry_Tag, 
       YEAR(Date) AS year,
       AVG(Adjusted_Close_Approx) AS average_Adjusted_Close
FROM dbo.StockData
GROUP BY Industry_Tag, YEAR(Date)
ORDER BY Industry_Tag, YEAR(Date);

--25:
SELECT  Country, Count(DISTINCT Brand_Name) AS number_of_stocks
FROM dbo.StockData
GROUP BY  Country
ORDER BY number_of_stocks DESC

--------------------------------------🔎 Time Series Trends----------------------------------------------
--26:
--Using Subquery
SELECT * FROM (
	SELECT Brand_Name , month_year, Average_close,
				MAX(Average_close) OVER (PARTITION BY Brand_Name)AS highest_average_Close
	FROM (
		SELECT  Brand_Name, FORMAT(date, 'yyyy-MM') AS month_year, 
					AVG([Close]) AS Average_close
		FROM dbo.StockData
		GROUP BY Brand_Name, FORMAT(date, 'yyyy-MM') 
	) AS sq
) AS sq_out 
WHERE Average_close = highest_average_Close
ORDER BY highest_average_Close DESC

--Using RANK(), or  ROW_NUMBER(), or...
SELECT * FROM (
	SELECT  Brand_Name, FORMAT(date, 'yyyy-MM') AS month_year, 
				AVG([Close]) AS Average_close,
				RANK() OVER(PARTITION BY Brand_Name ORDER BY AVG([Close]) DESC) AS rk
	FROM dbo.StockData
	GROUP BY Brand_Name, FORMAT(date, 'yyyy-MM') 
) AS sq WHERE rk =1
ORDER BY Average_close DESC

--27:
--Using RANK()
SELECT * FROM (
	SELECT  Brand_Name, Date, [Open], [Close] , [Close] - [Open] AS Negative_Change,
				RANK() OVER(PARTITION BY Brand_Name ORDER BY ([Close] - [Open]) ASC) AS rank_Diff
	FROM dbo.StockData
	WHERE YEAR(Date) = 2023
) AS sq WHERE rank_Diff <=5
ORDER BY Brand_Name

--Using CROSS APPLY() and TOP 5
SELECT TOP_5_PER_BRAND.Brand_Name, TOP_5_PER_BRAND.Date, TOP_5_PER_BRAND.[Open], TOP_5_PER_BRAND.[Close], TOP_5_PER_BRAND.Negative_Change
FROM (
    SELECT DISTINCT Brand_Name FROM dbo.StockData
) AS Brands
CROSS APPLY (
    SELECT TOP 5 
        Brand_Name, Date, [Open], [Close], ([Close] - [Open]) AS Negative_Change
    FROM dbo.StockData AS SD
    WHERE SD.Brand_Name = Brands.Brand_Name AND YEAR(Date) = 2023
    ORDER BY ([Close] - [Open]) ASC
) AS TOP_5_PER_BRAND
ORDER BY Brand_Name, Negative_Change;

-- Using Subquery
SELECT Brand_Name, Date, [Open], [Close],  ([Close] - [Open]) AS Negative_Change
FROM dbo.StockData AS S
WHERE YEAR(Date) = 2023
AND (
    SELECT COUNT(*) 
    FROM dbo.StockData AS S2
    WHERE S2.Brand_Name = S.Brand_Name
      AND YEAR(S2.Date) = 2023
      AND (S2.[Close] - S2.[Open]) < (S.[Close] - S.[Open])
) < 5
ORDER BY Brand_Name, Negative_Change;

-- 28:
SELECT  Date, COUNT(DISTINCT Brand_Name) AS number_of_stocks
FROM dbo.StockData
WHERE Dividends != 0
GROUP BY Date
HAVING COUNT(DISTINCT Brand_Name) >= 5
ORDER BY number_of_stocks DESC



--------------------------------------📉 Rights Offerings & Ticker Changes----------------------------------------------
-- 29:
SELECT  Brand_Name, COUNT (DISTINCT Ticker) AS numer_of_tickers
FROM dbo.StockData
GROUP BY Brand_Name
HAVING COUNT (DISTINCT Ticker) > 1 --> There is no Rand_name has more than one tickers in the dataset

-- 30:
SELECT DISTINCT t2023.Brand_Name, t2023.Ticker
FROM (
    SELECT DISTINCT Brand_Name, Ticker
    FROM dbo.StockData
    WHERE YEAR(Date) <= 2023
) AS t2023
LEFT JOIN (
    SELECT DISTINCT Brand_Name, Ticker
    FROM dbo.StockData
    WHERE YEAR(Date) = 2025
) AS t2025
ON t2023.Ticker = t2025.Ticker
WHERE t2025.Ticker IS NULL;
			-- CHeck the Year of all stocks. Using this to check the answer above
				SELECT  Brand_Name, MAX(YEAR(Date)) 
				FROM dbo.StockData
				GROUP BY Brand_Name

-------------------LOOK UP ALL THE COLUMNS, DATE TYPE------------------------------------------
SELECT  COLUMN_NAME,  DATA_TYPE,  CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'StockData' AND TABLE_SCHEMA = 'dbo';




