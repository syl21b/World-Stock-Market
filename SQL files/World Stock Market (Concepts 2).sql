
/* 
📈 Basic Price & Volume Analysis
	1.	What is the highest closing price for each ticker?
	2.	List the top 5 days with the highest trading volume for a specific stock.
	3.	What is the average closing price for each stock across the entire dataset?
	4.	Find all stocks that closed higher than they opened on a given day.
	5.	Which stock had the highest single-day gain (Close - Open)?
	6.	List all records where the stock’s lowest price was more than 10% below the open price.

⸻

🧮 Adjusted Close & Capital Gains
	7.	For each stock, show the average difference between the close and adjusted close price.
	8.	Find all dates where the adjusted close is lower than the actual close.
	9.	Which stocks had the highest capital gains on any single day?
	10.	What is the cumulative capital gain for each stock?

⸻

🪙 Dividends & Splits
	11.	Which stocks paid the highest total dividends?
	12.	List all stocks that had a stock split and their split ratios.
	13.	On how many days did each company pay dividends?
	14.	Find all stocks that had both dividends and stock splits on the same day.
	15.	For each company, find the average dividend yield (Dividend / Close * 100).

⸻

📊 Trend Detection & Patterns
	16.	Identify stocks that had 5 consecutive days of increasing closing prices.
	17.	List the 10 biggest one-day drops in closing price by percentage.
	18.	For each stock, calculate the number of trading days.
	19.	Identify stocks where the open and close prices were equal.
	20.	Which stocks had the highest average volatility (High - Low) over a month?

⸻

🌍 Company-Level and Metadata
	21.	List all companies and their industries.
	22.	Count how many companies are listed in each country.
	23.	What are the average daily trading volumes by industry?
	24.	For each brand, find the first and last available trading dates.
	25.	Which companies have changed tickers (hint: multiple tickers for same brand)?

⸻

⏱️ Time-Based Analysis
	26.	What is the monthly average closing price for each ticker?
	27.	Which year had the highest average trading volume across all stocks?
	28.	List the average capital gains per quarter for each stock.
	29.	Compare average close prices before and after a dividend event for a stock.
	30.	For each stock, show the average return on Mondays.
	*/
USE StockMarket;

SELECT *  FROM dbo.StockData

-------------------LOOK UP ALL THE COLUMNS, DATE TYPE------------------------------------------
SELECT  COLUMN_NAME,  DATA_TYPE,  CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'StockData' AND TABLE_SCHEMA = 'dbo';

--------------------------------Basic Price & Volume Analysis---------------------------------------------------------------
-- 1:
SELECT  Brand_Name, Ticker, MAX([Close]) AS highest_close
FROM dbo.StockData
GROUP BY Brand_Name, Ticker

-- 2:
--using CROSS APPLY () to find Top 5
SELECT s.Brand_Name, s.Date, s.Volume
FROM (
    SELECT DISTINCT Brand_Name FROM dbo.StockData
) b
CROSS APPLY (
    SELECT TOP 5 
        Brand_Name, Date, Volume
    FROM dbo.StockData
    WHERE Brand_Name = b.Brand_Name --AND YEAR(Date) = 2025
    ORDER BY Volume DESC
) s
ORDER BY s.Brand_Name, s.Volume DESC;
--Using RANK()
SELECT * FROM (
     SELECT  Brand_Name, Date, Volume,
                    RANK() OVER(PARTITION BY Brand_Name ORDER BY Volume DESC) AS rk
     FROM dbo.StockData
) AS sq WHERE rk<=5
ORDER BY  Brand_Name

-- 3: 
SELECT  Brand_Name, AVG([Close]) AS average_close
FROM dbo.StockData
GROUP BY Brand_Name

-- 4: 
SELECT  Brand_Name, Date, [Open], [Close]
FROM dbo.StockData
WHERE [Open] < [Close] AND Date BETWEEN '2025-05-01' AND '2025-05-31'

--5:
SELECT * FROM (
     SELECT  Brand_Name, Date, [Open], [Close],([Close] - [Open]) AS Gain
     FROM dbo.StockData
) AS sq
WHERE Gain =  (SELECT   MAX([Close] - [Open]) AS Gain
                              FROM dbo.StockData)

--6:
SELECT Brand_Name, Date, Low, [Open]
FROM dbo.StockData
WHERE Low < [Open] * 0.9;

--------------------------------🧮 Adjusted Close & Capital Gains---------------------------------------------------------------

-- 7: 
SELECT  Brand_Name, AVG([Close] - Adjusted_Close_Approx) AS average_difference
FROM dbo.StockData
GROUP BY Brand_Name

--8:
SELECT  Brand_Name, [Date],  Adjusted_Close_Approx, [Close]
FROM dbo.StockData
WHERE Adjusted_Close_Approx < [Close]

--9:
SELECT  TOP 1 Brand_Name, Date, Capital_Gain_Est AS highest_gain
FROM dbo.StockData
ORDER BY highest_gain DESC

--10.
     --Choose the first date 
	SELECT  Brand_Name, Date, Adjusted_Close_Approx,
				FIRST_VALUE(Adjusted_Close_Approx) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Initial_Price,
				(Adjusted_Close_Approx / FIRST_VALUE(Adjusted_Close_Approx) 
						OVER (PARTITION BY Brand_Name ORDER BY Date) - 1) * 100 AS Cumulative_Return_Percent
	FROM  dbo.StockData
	WHERE  Brand_Name = 'Apple'
	ORDER BY Date;

--------------------------------🪙 Dividends & Splits---------------------------------------------------------------
--11:
--Using Subquery
SELECT * FROM (
     SELECT  Brand_Name, SUM(Dividends) AS Total_Dividends
     FROM dbo.StockData
     GROUP BY Brand_Name
) AS sq
WHERE Total_Dividends = (SELECT MAX(Total_Dividends) FROM (    
                                                                 SELECT  Brand_Name, SUM(Dividends) AS Total_Dividends
                                                                 FROM dbo.StockData
                                                                 GROUP BY Brand_Name
                                                                 ) AS sq1)
-- Using RANK()
SELECT * FROM(
SELECT  Brand_Name, SUM(Dividends) AS Total_Dividends, 
               RANK() OVER(ORDER BY SUM(Dividends) DESC ) AS rk
FROM dbo.StockData
GROUP BY Brand_Name 
) AS sq
WHERE rk = 1

--12:
SELECT  Brand_Name, Date, [Stock Splits]
FROM dbo.StockData
WHERE [Stock Splits] !=0
ORDER BY Brand_Name

--13:
SELECT  Brand_Name, COUNT(Dividends) AS Dividends_days
FROM dbo.StockData
WHERE Dividends != 0
GROUP BY Brand_Name
ORDER BY Dividends_days DESC

-- 14: 
SELECT  Brand_Name, Date, Dividends, [Stock Splits]
FROM dbo.StockData
WHERE Dividends != 0 AND [Stock Splits] != 0

--15:
SELECT  Brand_Name, AVG((Dividends / [Close] * 100) )AS average_dividend_yield
FROM dbo.StockData
WHERE Dividends > 0 AND [Close] IS NOT NULL
GROUP BY Brand_Name
ORDER BY average_dividend_yield DESC;

--------------------------------🪙 Dividends & Splits---------------------------------------------------------------
--16:
-- Step 1: Anchor + Recursive CTE
WITH ConsecutiveUpDays AS (
    -- Anchor: Start with each day's closing price
    SELECT  Brand_Name, Date, [Close],
        1 AS StreakLength
    FROM dbo.StockData

    UNION ALL

    -- Recursive: Find next day with higher close
    SELECT  s.Brand_Name, s.Date,  s.[Close],
        c.StreakLength + 1
    FROM dbo.StockData s
    INNER JOIN ConsecutiveUpDays c
        ON s.Brand_Name = c.Brand_Name
          AND s.Date > c.Date
        AND s.Date = DATEADD(DAY, 1, c.Date)
        AND s.[Close] > c.[Close]
        AND c.StreakLength < 5
)

-- Step 2: Select results with 5-day streak
SELECT Brand_Name, Date, [Close]
FROM ConsecutiveUpDays
WHERE StreakLength = 5
ORDER BY Brand_Name, Date
OPTION (MAXRECURSION 1000);

--17
SELECT TOP 10 * FROM (
     SELECT * , ROW_NUMBER() OVER(PARTITION BY Brand_Name ORDER BY Close_Drop DESC) AS rn
     FROM (
          SELECT  Brand_Name, Date, 
               LAG([Close]) OVER (PARTITION BY Brand_Name  ORDER BY Date ASC) AS previous_Close, 
               [Close],  
               [Close] -LAG([Close]) OVER (PARTITION BY Brand_Name  ORDER BY Date ASC) AS Close_Drop
          FROM dbo.StockData
     ) AS sq0
) AS sq1
WHERE rn =1
ORDER BY Close_Drop DESC

--18
SELECT  Brand_Name, COUNT(DISTINCT Date) AS trading_days
FROM dbo.StockData
GROUP BY Brand_Name
ORDER BY trading_days DESC

--19
SELECT  Brand_Name, Date, [Open], [Close]
FROM dbo.StockData
WHERE [Open] = [Close]
ORDER BY Brand_Name

--20
--Using RANK()
SELECT * FROM (
     SELECT *, RANK() OVER(PARTITION BY Brand_Name ORDER BY volatility DESC) As rk
     FROM (
          SELECT  Brand_Name, FORMAT(Date, 'yyyy-MM') AS year_month, 
                    SUM(High) AS total_high_by_month, SUM (Low) AS total_low_by_month,
                    SUM(High) - SUM (Low) AS volatility
          FROM dbo.StockData
          GROUP BY Brand_Name, FORMAT(Date, 'yyyy-MM')
     ) AS sq0
) AS sq1 WHERE rk <=3
ORDER BY Brand_Name ; 

--using CROSS APPLY () to find Top 3
SELECT s.Brand_Name, s.year_month, s.volatility
FROM (
    SELECT DISTINCT Brand_Name FROM dbo.StockData
) b
CROSS APPLY (
    SELECT  TOP 3 Brand_Name, FORMAT(Date, 'yyyy-MM') AS year_month, 
          SUM(High) AS total_high_by_month, SUM (Low) AS total_low_by_month,
          SUM(High) - SUM (Low) AS volatility
     FROM dbo.StockData
    WHERE Brand_Name = b.Brand_Name 
    GROUP BY Brand_Name, FORMAT(Date, 'yyyy-MM')
    ORDER BY volatility DESC
) s
ORDER BY s.Brand_Name ; 

--------------------------------🌍 Company-Level and Metadata---------------------------------------------------------------

--21
SELECT  DISTINCT Brand_Name,  Industry_Tag
FROM dbo.StockData


--22
SELECT Country, COUNT(DISTINCT Brand_Name) As Number_of_Stocks
FROM dbo.StockData
GROUP BY Country

--23
SELECT  Industry_Tag, Date, AVG(Volume) AS Average_volume
FROM dbo.StockData
GROUP BY Industry_Tag, Date


--24
SELECT  Brand_Name, MIN(Date) AS first_day,  MAX(Date) AS last_day
FROM dbo.StockData
GROUP BY Brand_Name


--25
SELECT Brand_Name, COUNT(DISTINCT Ticker) As Number_of_ticker
FROM dbo.StockData
GROUP BY Brand_Name

--------------------------------⏱️ Time-Based Analysis---------------------------------------------------------------

--26
    SELECT   Brand_Name, FORMAT(Date, 'yyyy-MM') AS year_month, 
          AVG([Close]) AS Avg_Close
     FROM dbo.StockData
    GROUP BY Brand_Name, FORMAT(Date, 'yyyy-MM')
    ORDER BY Brand_Name

--27
SELECT  TOP 1 YEAR(Date) AS year, AVG(Volume) AS Avg_Volume
FROM dbo.StockData
GROUP BY YEAR(Date)
ORDER BY Avg_Volume DESC 

     --Bonus
     SELECT s.Brand_Name, s.year, s.Avg_Volume
     FROM (
     SELECT DISTINCT Brand_Name FROM dbo.StockData
     ) b
     CROSS APPLY (
          SELECT  TOP 1 Brand_Name, YEAR(Date) AS year, AVG(Volume) AS Avg_Volume
          FROM dbo.StockData
          WHERE Brand_Name = b.Brand_Name
          GROUP BY Brand_Name, YEAR(Date)
          ORDER BY  Avg_Volume DESC 
     ) AS s

--28
SELECT  Brand_Name, YEAR(Date) AS year, DATEPART(QUARTER, Date) AS quarter, AVG(Capital_Gain_Est) AS Avg_Capital_Gain
FROM dbo.StockData
GROUP BY Brand_Name, YEAR(Date),  DATEPART(QUARTER, Date)
-- Find the best-performing quarter per year for each stock based on average capital gains
          -- Using CROSS APPLY(). Create CTE to reduce the outer query's row
          WITH BrandYear AS (
          SELECT DISTINCT Brand_Name, YEAR(Date) AS Year
          FROM dbo.StockData
          )
          SELECT by1.Brand_Name, by1.Year, sd_year.Best_Quarter, sd_year.Avg_Capital_Gain
          FROM BrandYear AS by1
          CROSS APPLY (
          SELECT TOP 1
               DATEPART(QUARTER, Date) AS Best_Quarter,
               AVG(Capital_Gain_Est) AS Avg_Capital_Gain
          FROM dbo.StockData
          WHERE Brand_Name = by1.Brand_Name AND YEAR(Date) = by1.Year
          GROUP BY DATEPART(QUARTER, Date)
          ORDER BY AVG(Capital_Gain_Est) DESC
          ) sd_year
          ORDER BY by1.Brand_Name, by1.Year

          --Using Subquery
          SELECT Brand_Name, year, quarter, Avg_Capital_Gain
          FROM (
          SELECT  Brand_Name,  YEAR(Date) AS year, DATEPART(QUARTER, Date) AS quarter,
               AVG(Capital_Gain_Est) AS Avg_Capital_Gain,
               ROW_NUMBER() OVER (PARTITION BY Brand_Name, YEAR(Date) ORDER BY AVG(Capital_Gain_Est) DESC) AS rn
          FROM dbo.StockData
          GROUP BY Brand_Name, YEAR(Date), DATEPART(QUARTER, Date)
          ) AS ranked
          WHERE rn = 1
          ORDER BY Brand_Name, year;

--29
/*
DividendEvents: Filters all rows with a dividend.
CloseAroundDividend: Gets prices within 3 days before and after each dividend.
*/
WITH DividendEvents AS (
    SELECT Brand_Name, Date AS DividendDate
    FROM dbo.StockData
    WHERE Dividends > 0
),
CloseAroundDividend AS (
    SELECT  d.Brand_Name, d.DividendDate,  s.Date, s.[Close],
        CASE 
            WHEN s.Date < d.DividendDate THEN 'Before'
            WHEN s.Date > d.DividendDate THEN 'After'
            ELSE 'On'
        END AS Period
    FROM DividendEvents d
    JOIN dbo.StockData s
        ON d.Brand_Name = s.Brand_Name
        AND ABS(DATEDIFF(DAY, d.DividendDate, s.Date)) <= 3
)
SELECT Brand_Name, Period, AVG([Close]) AS Avg_Close
FROM CloseAroundDividend
WHERE Period IN ('Before', 'After')
GROUP BY Brand_Name, Period
ORDER BY Brand_Name, Period;

--30
--Return =() (Close - Open) / Open )*100
SELECT  Brand_Name,
    AVG(CAST(([Close] - [Open]) * 100.0 / NULLIF([Open], 0) AS FLOAT)) AS Avg_Monday_Return
FROM dbo.StockData
WHERE DATENAME(WEEKDAY, Date) = 'Monday'
GROUP BY Brand_Name
ORDER BY Avg_Monday_Return DESC;