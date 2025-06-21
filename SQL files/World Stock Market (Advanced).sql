/*
📉 Advanced Price Movements & Behavior
	1.	Detect price reversals: Identify stocks that experienced a 3-day losing streak followed by a 3-day gain streak within a month.
	2.	Moving average crossover: For each stock, find the date when the 7-day moving average crosses above the 30-day average.
        💡 Breakdown:
        •	7-day moving average (MA7): The average of the past 7 days’ closing prices. It responds quickly to recent price changes.
        •	30-day moving average (MA30): A slower, more stable average over a longer period.
        •	Crossover: This happens when the faster MA (7-day) moves from below to above the slower MA (30-day). It indicates upward momentum.
        
  3.	Candlestick pattern detection: Identify days where a BULLISH engulfing pattern occurred.
          A BULLISH engulfing is a candlestick pattern that often signals a potential reversal from a downtrend to an uptrend. 
          It occurs over two consecutive days:
              •	Day 1: A bearish candle — the stock closes lower than it opens.
              •	Day 2: A bullish candle — the stock opens lower than or equal to Day 1’s close and closes higher than Day 1’s open, engulfing the entire Day 1 candle.
                                Condition                                                  Explanation
                                D-1: Close < Open                       Bearish candle on previous day
                                D: Close > Open                           Bullish candle on current day
                                D: Open ≤ D-1 Close                    Current day opens lower or equal to previous close
                                D: Close ≥ D-1 Open                    Current day closes higher or equal to previous open
                                Optionally: D-1 volume high        Higher volume on D can add strength to the signal
              • To confirm it, the third candle must close aboce the currrent candle close


	4.	Gap analysis: List stocks with a gap up or gap down of more than 3% compared to the previous day’s close.
        	•	A gap up occurs when today’s open price is significantly higher than the previous day’s close.
	        •	A gap down occurs when today’s open price is significantly lower than the previous day’s close.
                      Gap % = ((Today_Open - Previous_Close) / Previous_Close) * 100

	5.	High volatility cluster: Identify stocks that had volatility (High - Low) to Open > 5% for 3 or more consecutive days.
                                    (High - Low) / Open > 0.05
        Assumpt that the next row is the next consecutive day.
	6.	Rolling returns: Calculate the 15-day rolling return (percentage change) for each stock.
              * Rolling return is the return over a fixed past period, calculated continuously across time (e.g., 7-day, 30-day, 90-day).
                        Rolling Return= ( Close (today) - Close (15 days ago) )/ Close (15 days ago)
	7.	Volume-price divergence: Find stocks where price dropped but volume spiked in the same day.
	8.	Double top formation: Identify stocks where the price peaked twice within 30 days (or a month) but failed to break the previous high.

⸻

🧠 Behavioral & Sentiment Proxies
	9.	Identify panic selling: Detect days where Close dropped >5% and Volume spiked >150% compared to 30-day (or monthly) average.
	10.	Retail trading signal: Spot stocks with abnormally high daily trading volume compared to the 30-day average
	11.	High-frequency spikes: Detect days with unusually high daily intraday volatility compared to monthly average volatility.
        * "intraday volatility": refers to a measure of the annualized standard deviation—or statistical variation from the average—of the daily 
        percentage price changes of a security or commodity. In other words, it is a degree of uncertainty based on 
        historical moves over some set period.
        * market value fluctuations more than 3% should be avoided while performing intraday trading, 
          as the possibility of incurring a loss is huge in case of an adverse downturn in the stock market in an economy.
	12.	Price anchoring: Identify stocks that frequently close near their 5-day average open price in 2024.
	13.	Range breakout: Detect when a stock breaks out of its 20-day high or low range. (beyond a significant recent range)

⸻

💹 Technical Indicators & Signals
	14.	RSI calculation: Compute the 14-day Relative Strength Index (RSI) and list stocks where RSI crosses 70 or 30.
          The Relative Strength Index (RSI) is a technical indicator used in trading to measure the magnitude 
          of recent price changes to evaluate overbought or oversold conditions.
          
          Here's a step-by-step breakdown of the RSI calculation:
              1. Calculate Average Gain and Loss:
                    Determine the time period:
                      Typically, the RSI is calculated over a 14-day period, but this can be adjusted. 
                    Calculate daily price changes:
                      For each day within the time period, determine the difference between the closing price and the previous closing price. 
                    Separate gains and losses:
                      Categorize the price changes as either gains (positive values) or losses (absolute value of negative values). 
                    Calculate average gain and loss:
                      Sum the gains and losses over the specified period, then divide by the number of periods to get the average gain and average loss, respectively. 
              2. Calculate Relative Strength (RS):
                    Divide the average gain by the average loss. 
              3. Calculate RSI:
                    Use the following formula: RSI = 100 - (100 / (1 + RS)). 
                    Example: 
                    Let's say over a 14-day period, the average gain is 1.5% and the average loss is 0.75%. 
                    Average gain: 1.5%
                    Average loss: 0.75%
                    Relative Strength (RS): 1.5% / 0.75% = 2
                    RSI: 100 - (100 / (1 + 2)) = 100 - (100 / 3) = 100 - 33.33 = 66.67.
              Interpreting the RSI:
              RSI above 70: May indicate an overbought condition, suggesting the asset could be due for a price correction. 
              RSI below 30: May indicate an oversold condition, suggesting a potential upward price reversal. 
              RSI between 30 and 70: Generally considered a neutral zone, indicating a balanced market. 
	
  15.	MACD crossover: Calculate MACD and signal line for each stock and identify bullish crossovers.
        To identify bullish MACD crossovers, you first need to calculate the MACD line and signal line for each stock. A bullish crossover occurs when the MACD line crosses above the signal line, indicating a potential upward trend. 
        Here's how to calculate and interpret MACD crossovers:
            1. Calculate the MACD Line:
              Step 1: Calculate the 12-period Exponential Moving Average (EMA) of the stock's closing price.
                      The basic formula for an EMA is: 
                        EMA = (Closing Price x Smoothing Factor) + (Previous EMA x (1 – Smoothing Factor)). 
              Step 2: Calculate the 26-period EMA of the stock's closing price.
            Step 3: Subtract the 26-period EMA from the 12-period EMA to get the MACD line. 
            2. Calculate the Signal Line:
              Step 4: Calculate the 9-period EMA of the MACD line (the result from step 3). This is your signal line. 
            3. Identify Bullish Crossovers:
              Step 5:
              Look for instances where the MACD line crosses above the signal line. This indicates a potential bullish signal. 
              Step 6:
              A bullish crossover suggests that short-term momentum is turning positive, potentially indicating an upward trend. 
      (THIS TAKES A LONG TIME TO RUN THE CODE - PYTHON may be a better language in this case)

	16.	Bollinger Bands squeeze: Find days where the Bollinger Band width is at a 20-day minimum.
     
      The Bollinger Bandwidth formula calculates the relative width of Bollinger Bands, providing insight into volatility changes. It's calculated as the difference between the upper and lower bands divided by the middle band, then often multiplied by 100 to represent it as a percentage. 
          Steps to Detect Bollinger Band Squeeze:
                  1.	Calculate the 20-day Simple Moving Average (SMA):
                    •	This is the average of the last 20 closing prices.
                  2.	Calculate the 20-day Standard Deviation (SD):
                    •	Use the same 20-day window to get the SD of the closing price.
                  3.	Compute Bollinger Bands:
                    •	Upper Band = 20-day SMA + (2 × 20-day SD)
                    •	Lower Band = 20-day SMA − (2 × 20-day SD)
                  4.	Calculate Bollinger Band Width:
                    •	Band Width = Upper Band − Lower Band
                  5.	Find the 20-day minimum Band Width for each date:
                    •	For each day, compute the minimum Band Width over the previous 20 days (not just 20 rows).
                  6.	Flag a Squeeze:
                  •	If today’s Band Width is equal (or less) to the 20-day minimum → it’s a squeeze day.
          Significance:
            The Squeeze:
              A narrowing bandwidth (the "squeeze") can precede a significant price movement, as it indicates a period of low volatility.
            Volatility:
              Wider bandwidths indicate higher volatility, while narrower bandwidths indicate lower volatility. 

	17.	Stochastic oscillator: Compute %K and %D lines and identify overbought/oversold signals.
      
      The Stochastic Oscillator is a momentum indicator that compares a stock’s closing price to its price range over a recent period (commonly 14 days).
      Steps to Calculate %K and %D:

              1. Choose a Lookback Period (usually 14 days)

              2. For each day, calculate:
                •	Lowest Low over the past 14 days
                •	Highest High over the past 14 days

              3. Calculate %K line (Raw momentum: Fast Stochastic- Fast signal, more reactive):
                  %K = (Close - Lowest Low(14) ) * 100 /  (Highest High(14) - Lowest Low (14))

              4. Calculate %D line (Smoothed %K: Slow Stochastic - Slow signal, helps confirm momentum trends):
                •	%D = 3-day Simple Moving Average (SMA) of %K
              ⸻
              🔍 Interpret Signals:
                •	Overbought:
              If %K or %D > 80 → stock might be overbought (potential for price to drop)
                •	Oversold:
              If %K or %D < 20 → stock might be oversold (potential for price to rise)
              ⸻
              🧠 Optional Add-ons:
                •	Identify crossovers between %K and %D
                •	Bullish: %K crosses above %D from below: Prev_%K < Prev_%D AND Current_%K > Current_%D
                •	Bearish: %K crosses below %D from above: Prev_%K > Prev_%D AND Current_%K < Current_%D

⸻

📊 Event & Post-event Analysis
	18.	Post-dividend drift: Measure average return 5 days after a dividend announcement.
	19.	Split volatility: Analyze changes in stock price volatility by comparing the average daily volatility for the 60 days before and 60 days after the latest stock split for each stock.
                Volatility can be daily price range (e.g., (High - Low) / Open or (High - Low) / Close).
  20.	Price performance post-earnings (if earnings data exists): Compare Close prices 3 days before and after earnings events.
            Apple (AAPL) had its most recent earnings event for the second quarter ending March 29, 2025, reported on May 1, 2025. The company announced financial results, including revenue and earnings per share, according to Apple. 
            So, let's take March 29, 2025 as the earning date for all brand
	21.	Market reaction: Analyze abnormal price movements and volume spikes to detect potential market-moving corporate events
        Identify stocks that had:
              •	A daily return greater than a certain threshold (e.g., > ±10%)
              •	And/or a volume spike, say 50% higher than the 10-day average volume
        These may indicate events like mergers, acquisitions, earnings surprises, or product announcements.
⸻

🧾 Portfolio & Risk Metrics
	22. Estimate the volatility of each stock by calculating the standard deviation of its daily returns over a rolling last-90-day window.
	23.	Sharpe ratio: Calculate the Sharpe ratio for each stock over the last 6 months (assume risk-free rate = 2% annualized). 
        (Assuming 252 trading days in a year)
        
        Sharpe Ratio = (Average Daily Return - Daily Risk - Free Rate) / Standard Deviation of Daily Returns

        Since our dataset doesn’t include a separate risk-free asset or rate per day, we manually assume the daily risk-free rate based on the provided annualized rate (2%).
        We can approximate it using a constant based on the 2% annualized rate. So,
        Daily Risk - Free Rate = 2% / 252
                Classification Logic: 
                    Sharpe Ratio ≥ 1:         Strong performer
                    Sharpe Ratio < 1:         Weak performer
                    Volatility (Std Dev) ≥ 0.02:        Risky
                    Volatility < 0.02:                        Stable

	24.	Max drawdown: Find the maximum drawdown from peak to trough for each stock in 2024.
          	•	A stock with a max drawdown of -30% means it lost 30% from its peak price before recovering.
	          •	It’s a key risk metric to evaluate downside risk in trading or investing.
	25.	Sortino ratio: Compute the Sortino ratio considering only downside deviation.
      The Sortino Ratio is similar to the Sharpe Ratio but only penalizes downside volatility (returns below a minimum acceptable return, often the risk-free rate or 0%).
              Sortino Ratio = (Average Daily Return - Daily Risk - Free Rate) / Downside Deviation
              where : Standard Deviation of those negative values = downside deviation

              Risk-Based Categorization:
                      You can assign risk performance labels based on the Sortino Ratio:
                        •	Sortino ≥ 1.5 → Strong & Stable
                        •	1.0 ≤ Sortino < 1.5 → Good
                        •	0.5 ≤ Sortino < 1.0 → Moderate
                        •	0 ≤ Sortino < 0.5 → Weak
                        •	Sortino < 0 → Risky & Underperforming
              
              Why Use Sortino Instead of Sharpe?
                              Sharpe Ratio                                                                  Sortino Ratio
                Penalizes both upside and downside volatility                     Penalizes only downside volatility
                Useful for general comparison                                             Better when you care only about bad risk
                Might undervalue high-upside stocks                                   Better for risk-averse or defensive investing


⸻

🕒 Time-Series Signal Detection
	26.	Lagging vs leading signals: Identify stocks where the daily trading volume increased by more than 100% compared
         to the previous day, and the stock’s closing price changed by more than ±5% exactly 2 days after the volume spike.
	27.	Holiday effect: Check average returns on the day before and after major holidays (New Year, Thanksgiving, and Christmas, etc).
	28.	Monday vs Friday performance: Compare average returns on Mondays vs Fridays for each stock.
	29.	Quarter-end effect: Check if stock returns are abnormally higher on last days of fiscal quarters.
	30.	Momentum detection: Identify stocks with 5%+ return in past 20 days and positive return in current week.
     */
ALTER TABLE dbo.StockData
DROP COLUMN Adjusted_Close_Approx;

ALTER TABLE dbo.StockData
DROP COLUMN Capital_Gain_Est;

DROP TABLE dbo.StockData;

USE StockMarket;

SELECT DISTINCT Brand_Name FROM dbo.StockData;

-------------------LOOK UP ALL THE COLUMNS, DATE TYPE------------------------------------------
SELECT  COLUMN_NAME,  DATA_TYPE,  CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'StockData' AND TABLE_SCHEMA = 'dbo';


SELECT *  FROM dbo.StockData

-------------------------------📉 Advanced Price Movements & Behavior-------------------------------------
-- 1:
WITH Get_6_Days AS (
    SELECT 
        Brand_Name,
        Date,
        LAG([Close], 3) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Day1,
        LAG([Close], 2) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Day2,
        LAG([Close], 1) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Day3,
        [Close] AS Day4,
        LEAD([Close], 1) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Day5,
        LEAD([Close], 2) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Day6
    FROM dbo.StockData
)
SELECT *
FROM Get_6_Days
WHERE Day1  IS NOT NULL AND Day2 IS NOT NULL AND Day3 IS NOT NULL 
	AND Day4 IS NOT NULL AND Day5 IS NOT NULL AND Day6 IS NOT NULL 
	AND Day1 > Day2 AND Day2 > Day3     -- Check 3-day losing streak
	AND Day4 < Day5 AND Day5 < Day6	  -- Followed by 3-day gain streak
	 -- Optional: Ensure all within same month/year
    AND MONTH(Date) = MONTH(DATEADD(DAY, 5, Date)) 
    AND YEAR(Date) = YEAR(DATEADD(DAY, 5, Date));


-- Chat GPT answer
WITH Price_Change AS (
  SELECT  Brand_Name, Date, [Close],
    LAG([Close], 1) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_Close
  FROM dbo.StockData
),
Daily_Direction AS (
  SELECT *,
    CASE 
      WHEN [Close] > Prev_Close THEN 1
      WHEN [Close] < Prev_Close THEN -1
      ELSE 0
    END AS Direction
  FROM Price_Change
  WHERE Prev_Close IS NOT NULL
),
Numbered AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY Date) AS rn
  FROM Daily_Direction
),
Streaks AS (
  SELECT 
    t1.Brand_Name, t1.Date AS Start_Date,
    t1.Direction AS D1, t2.Direction AS D2, t3.Direction AS D3,
    t4.Direction AS D4, t5.Direction AS D5, t6.Direction AS D6
  FROM Numbered t1
  JOIN Numbered t2 ON t1.Brand_Name = t2.Brand_Name AND t2.rn = t1.rn + 1
  JOIN Numbered t3 ON t1.Brand_Name = t3.Brand_Name AND t3.rn = t1.rn + 2
  JOIN Numbered t4 ON t1.Brand_Name = t4.Brand_Name AND t4.rn = t1.rn + 3
  JOIN Numbered t5 ON t1.Brand_Name = t5.Brand_Name AND t5.rn = t1.rn + 4
  JOIN Numbered t6 ON t1.Brand_Name = t6.Brand_Name AND t6.rn = t1.rn + 5
  WHERE 
    t1.Direction = -1 AND t2.Direction = -1 AND t3.Direction = -1 AND
    t4.Direction = 1 AND t5.Direction = 1 AND t6.Direction = 1 AND
    MONTH(t1.Date) = MONTH(t6.Date) AND YEAR(t1.Date) = YEAR(t6.Date)
)
SELECT * FROM Streaks;


--2
-- This does not guarantee that moving average falls within 7 days and 30 days. 
-- It just calculates moving average with 7 rows and 30 rows
SELECT Brand_Name, Date,
  AVG ([Close]) OVER ( PARTITION BY Brand_Name ORDER BY Date
  ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) Moving_Average7,
  AVG ([Close]) OVER ( PARTITION BY Brand_Name ORDER BY Date
  ROWS BETWEEN CURRENT ROW AND 29 FOLLOWING) Moving_Average30
FROM dbo.StockData

WITH Base AS (
    SELECT Brand_Name, Date, [Close]
    FROM dbo.StockData
),
MA7 AS (
    SELECT b1.Brand_Name, b1.Date,
           AVG(b2.[Close]) AS MA7
    FROM Base b1
    JOIN Base b2
      ON b1.Brand_Name = b2.Brand_Name
     AND b2.Date BETWEEN DATEADD(DAY, -6, b1.Date) AND b1.Date
    GROUP BY b1.Brand_Name, b1.Date
),
MA30 AS (
    SELECT b1.Brand_Name, b1.Date,
           AVG(b2.[Close]) AS MA30
    FROM Base b1
    JOIN Base b2
      ON b1.Brand_Name = b2.Brand_Name
     AND b2.Date BETWEEN DATEADD(DAY, -29, b1.Date) AND b1.Date
    GROUP BY b1.Brand_Name, b1.Date
),
Combined AS (
    SELECT 
        m7.Brand_Name,
        m7.Date,
        m7.MA7,
        m30.MA30,
        b.[Close],
        LAG(m7.MA7) OVER (PARTITION BY m7.Brand_Name ORDER BY m7.Date) AS Prev_MA7,
        LAG(m30.MA30) OVER (PARTITION BY m30.Brand_Name ORDER BY m30.Date) AS Prev_MA30
    FROM MA7 m7
    JOIN MA30 m30 ON m7.Brand_Name = m30.Brand_Name AND m7.Date = m30.Date
    JOIN Base b ON b.Brand_Name = m7.Brand_Name AND b.Date = m7.Date
)
SELECT 
    Brand_Name,
    Date AS CrossoverDate,
    [Close] AS PriceAtCrossover,
    MA7 AS SevenDayMovingAverage,
    MA30 AS ThirtyDayMovingAverage
FROM Combined
WHERE MA7 > MA30 AND (Prev_MA7 <= Prev_MA30 OR Prev_MA7 IS NULL OR Prev_MA30 IS NULL)
ORDER BY Brand_Name, Date;


WITH MovingAverages AS (
    SELECT 
        Brand_Name,
        Date,
        [Close],
        AVG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS MA7,
        AVG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS MA30
    FROM dbo.StockData
),
WithPreviousValues AS (
    SELECT 
        Brand_Name,
        Date,
        [Close],
        MA7,
        MA30,
        LAG(MA7, 1) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_MA7,
        LAG(MA30, 1) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_MA30
    FROM MovingAverages
)
SELECT 
    Brand_Name,
    Date AS CrossoverDate,
    [Close] AS PriceAtCrossover,
    MA7 AS SevenDayMovingAverage,
    MA30 AS ThirtyDayMovingAverage
FROM WithPreviousValues
WHERE 
    MA7 > MA30 AND 
    (Prev_MA7 < Prev_MA30 OR Prev_MA7 IS NULL OR Prev_MA30 IS NULL)
ORDER BY Brand_Name, Date;


-- 3: 
--a BULLISH engulfing pattern 
SELECT * FROM (
    SELECT Brand_Name, Date,
                    LAG([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS previous_close,
                    [Close] AS current_close, 
                    LEAD([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS next_close,
                    LAG([Open] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS previous_open,
                    [Open] AS current_open,
                    LEAD([Open] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS next_open
                
    FROM dbo.StockData
    WHERE Brand_Name = 'apple'
) AS sd
WHERE         current_open <= previous_close 
              AND current_close >= previous_open
              AND previous_close < previous_open -- Bearish candle before
              AND current_close > current_open      -- Bullish engulfing candle
              AND next_close > current_close          --the third candle must close aboce the currrent candle close

-- a BEARISH engulfing pattern 
SELECT * FROM (
    SELECT Brand_Name, Date,
                    LAG([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS previous_close,
                    [Close] AS current_close, 
                    LEAD([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS next_close,
                    LAG([Open] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS previous_open,
                    [Open] AS current_open,
                    LEAD([Open] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS next_open
                
    FROM dbo.StockData
    WHERE Brand_Name = 'apple'
) AS sd
WHERE         current_open >= previous_close 
              AND current_close <= previous_open
              AND previous_close > previous_open -- Bullish candle on previous day
              AND current_close < current_open      -- Bearish candle on current day
              AND next_close < current_close          --Third candle confirms downward move

-- 4:
SELECT *, 
          CASE  WHEN current_open > previous_close THEN 'Gap Up'
          ELSE ' Gap Down'
          END Gap_Occur
FROM (
  SELECT Brand_Name, Date,
                    LAG([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) AS previous_close,
                    [Open] AS current_open,
                    (([Open]  - LAG([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) ) 
                                    / LAG([Close] ) OVER(PARTITION BY Brand_Name ORDER BY Date ) ) * 100 AS Gap_Percentage
  FROM dbo.StockData
) AS sd0   WHERE previous_close IS NOT NULL AND ABS(Gap_Percentage) > 3

-- 5: 
SELECT * FROM (
  SELECT Brand_Name, Date, High, Low, 
         (High - Low) / NULLIF([Open], 0) AS day0_volatility,
         
         LEAD(High - Low, 1) OVER(PARTITION BY Brand_Name ORDER BY Date) 
           / NULLIF(LEAD([Open], 1) OVER(PARTITION BY Brand_Name ORDER BY Date), 0) AS Day1_volatility,
         
         LEAD(High - Low, 2) OVER(PARTITION BY Brand_Name ORDER BY Date) 
           / NULLIF(LEAD([Open], 2) OVER(PARTITION BY Brand_Name ORDER BY Date), 0) AS Day2_volatility
  FROM dbo.StockData
) AS sd
WHERE day0_volatility > 0.05
  AND Day1_volatility > 0.05
  AND Day2_volatility > 0.05


 WITH VolatilityDays AS (
    SELECT Brand_Name, Date, 
           (High - Low) / NULLIF([Open], 0) AS Volatility
    FROM dbo.StockData
    WHERE [Open] != 0
),
HighVolDays AS (
    SELECT Brand_Name, Date
    FROM VolatilityDays
    WHERE Volatility > 0.05
),
RecursiveStreak AS (
    -- Anchor: First day of a streak
    SELECT Brand_Name, Date, 1 AS streak_length
    FROM HighVolDays

    UNION ALL

    -- Recursive step: Add next consecutive day
    SELECT h.Brand_Name, h.Date, r.streak_length + 1
    FROM HighVolDays h
    JOIN RecursiveStreak r
      ON h.Brand_Name = r.Brand_Name
     AND h.Date = DATEADD(DAY, 1, r.Date)
)
-- Final filter: Only streaks of 3 or more days
SELECT Brand_Name, Date, streak_length
FROM RecursiveStreak
WHERE streak_length >= 3
ORDER BY Brand_Name, Date;


-- 6: 
SELECT Brand_Name, [Date],
       ([Close] - LAG([Close], 14) OVER (PARTITION BY Brand_Name ORDER BY Date)) * 1.0
       / NULLIF(LAG([Close], 14) OVER (PARTITION BY Brand_Name ORDER BY Date), 0) AS RollingReturn15Day
FROM dbo.StockData;


-- 7
SELECT * FROM (
  SELECT Brand_Name, 
              LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PreviousClose,
               [Close] AS CurrentClose,
              LAG([Volume]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PreviousVolume, 
              Volume AS CurrentVolume
  FROM dbo.StockData
) AS sq WHERE PreviousClose IS NOT NULL 
                  AND PreviousVolume IS NOT NULL
                  AND PreviousClose > CurrentClose
                  AND PreviousVolume < CurrentVolume 


-- 8: 
SELECT *
FROM (
    SELECT Brand_Name, Date, High,
           LAG(High) OVER (PARTITION BY Brand_Name ORDER BY Date) AS prev_high,
           LAG(Date) OVER (PARTITION BY Brand_Name ORDER BY Date) AS prev_date
    FROM dbo.StockData
) AS sd
WHERE prev_high IS NOT NULL
  AND DATEDIFF(DAY, prev_date, Date) <= 30
  --AND ABS(High - prev_high) / prev_high <= 0.05
  AND High <= prev_high  -- second peak does not exceed the first


SELECT a.Brand_Name, a.Date AS first_peak_date, a.High AS first_high,
       b.Date AS second_peak_date, b.High AS second_high
FROM dbo.StockData a
JOIN dbo.StockData b
  ON a.Brand_Name = b.Brand_Name
 AND DATEDIFF(DAY, a.Date, b.Date) BETWEEN 1 AND 30
--WHERE ABS(a.High - b.High) / a.High <= 0.05  -- within 5%
  AND b.High <= a.High  -- second peak fails to break first

--Bonus: “Identify stocks that formed two descending price peaks within the same month, where the second peak was lower than the first.”
SELECT * FROM (
      SELECT Brand_Name, Date, year_month, High, high_peak AS first_peak,
              
              LEAD(Brand_Name) OVER (PARTITION BY FORMAT(Date, 'yyyy-MM') ORDER BY high_peak) AS second_brand,
              LEAD(Date) OVER (PARTITION BY FORMAT(Date, 'yyyy-MM') ORDER BY high_peak) AS second_Date,
              LEAD(High) OVER (PARTITION BY FORMAT(Date, 'yyyy-MM') ORDER BY high_peak) AS second_High,
              LEAD(high_peak) OVER (PARTITION BY FORMAT(Date, 'yyyy-MM') ORDER BY high_peak) AS second_peak
      From (
          SELECT Brand_Name, Date, FORMAT(Date, 'yyyy-MM') AS year_month, High,
                        RANK() OVER(PARTITION BY  FORMAT(Date, 'yyyy-MM') ORDER BY High DESC) AS high_peak
          FROM dbo.StockData 
          --ORDER BY year_month,high_peak 
    ) AS sd 
) AS sd1 
WHERE first_peak =1 AND second_brand IS NOT NULL AND second_Date IS NOT NULL AND second_year_month IS NOT NULL AND
                second_High IS NOT NULL AND second_peak IS NOT NULL 
                AND Brand_Name = second_brand AND year_month = second_year_month
                AND Second_high < High
ORDER BY year_month
-------------------------------🧠 Behavioral & Sentiment Proxies-------------------------------------
-- 9:
WITH GetPreClose AS (
  SELECT Brand_Name, Date, [Close] , 
        LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PreviousClose, 
       ( [Close] - LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) ) * 100 / LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Close_drop,
        Volume
  FROM dbo.StockData
)
, AvgVolume AS (
  SELECT Brand_Name, FORMAT(Date, 'yyyy-MM' ) AS year_month, 
    AVG(Volume) AS avg_Volume
  FROM dbo.StockData
  GROUP BY Brand_Name, FORMAT(Date, 'yyyy-MM' )
)
SELECT gpc.Brand_Name, gpc.Date, av.year_month,  [Close] , gpc.PreviousClose, gpc.Volume, av.avg_Volume FROM GetPreClose AS gpc  
LEFT JOIN AvgVolume AS av ON gpc.Brand_Name = av.Brand_Name AND FORMAT(gpc.Date, 'yyyy-MM' ) = av. year_month
WHERE gpc.PreviousClose IS NOT NULL
  AND [Close] < gpc.PreviousClose
    AND -( [Close]- gpc.PreviousClose ) * 100 / NULLIF(gpc.PreviousClose, 0) > 5 -- dropped more than 5%
    AND (Volume-avg_Volume)*100 / NULLIF(avg_Volume,0) > 150
ORDER BY gpc.Brand_Name, av.year_month


-- 10:
-- This does not guarantees that AVG(Volume) fall between 30 days
WITH VolumeWithAvg AS (
    SELECT Brand_Name, Date, Volume,
           AVG(Volume) OVER ( PARTITION BY Brand_Name ORDER BY Date
               ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
           ) AS Rolling30DayAvgVolume
    FROM dbo.StockData
)
SELECT *
FROM VolumeWithAvg
WHERE Rolling30DayAvgVolume IS NOT NULL
      AND Volume > 2 * Rolling30DayAvgVolume  -- adjust threshold (e.g., 2x = 200%)
ORDER BY Brand_Name, Date;
-- This guarantees that AVG(Volume) fall between 30 days
WITH DailyVolume AS (
    SELECT Brand_Name, Date, Volume
    FROM dbo.StockData
),
RollingVolumeAvg AS (
    SELECT d1.Brand_Name,  d1.Date,  d1.Volume,
           (
             SELECT AVG(d2.Volume)
             FROM dbo.StockData d2
             WHERE d2.Brand_Name = d1.Brand_Name
                  AND d2.Date BETWEEN DATEADD(DAY, -30, d1.Date) AND d1.Date
           ) AS Rolling30DayAvgVolume
    FROM DailyVolume d1
)
SELECT *
FROM RollingVolumeAvg
WHERE Rolling30DayAvgVolume IS NOT NULL
  AND Volume > 2 * Rolling30DayAvgVolume  -- Volume spike > 100%
ORDER BY Brand_Name, Date;


-- 11:
WITH DailyRange AS (
  SELECT  Brand_Name, Date, FORMAT(Date, 'yyyy-MM') AS year_month, High - Low AS daily_range
  FROM dbo.StockData
),
MonthlyAvgRange AS (
  SELECT  Brand_Name, year_month, AVG(daily_range) AS avg_monthly_range
  FROM DailyRange
  GROUP BY Brand_Name, year_month
)
SELECT  dr.Brand_Name,  dr.Date, dr.daily_range, mar.avg_monthly_range
FROM DailyRange dr
JOIN MonthlyAvgRange mar
  ON dr.Brand_Name = mar.Brand_Name AND dr.year_month = mar.year_month
WHERE dr.daily_range > 2 * mar.avg_monthly_range
ORDER BY dr.Brand_Name, dr.Date;


-- 12:
SELECT Brand_Name, COUNT(*) AS frequency FROM (
  SELECT d1.Brand_Name,  d1.Date,  d1.[Close] , 
        (
          SELECT AVG(d2.[Open])
          FROM dbo.StockData d2
          WHERE d2.Brand_Name = d1.Brand_Name
              AND d2.Date BETWEEN DATEADD(DAY, -4, d1.Date) AND d1.Date
        ) AS Rolling5DayAvgOpen
  FROM    (SELECT Brand_Name, Date, [Close]
                FROM dbo.StockData) AS d1
) AS sd_out
WHERE ABS([Close] - Rolling5DayAvgOpen)  < 0.01 --nearly equal
       AND YEAR(Date) = 2024
GROUP BY Brand_Name
ORDER BY frequency DESC


-- 13: 
SELECT Brand_Name, Date, High, Max20DayHigh
FROM ( 
  SELECT  Brand_Name,  Date,  High,
        ( --Finding Max(High)
          SELECT MAX(d2.High) FROM dbo.StockData d2
          WHERE d2.Brand_Name = d1.Brand_Name
            AND d2.Date BETWEEN DATEADD(DAY, -20, d1.Date) AND DATEADD(DAY, -1, d1.Date)
        ) AS Max20DayHigh
    FROM dbo.StockData AS d1
) AS breakout_check
WHERE High > Max20DayHigh AND Max20DayHigh IS NOT NULL
ORDER BY Brand_Name, Date;

-------------------------------💹 Technical Indicators & Signals-------------------------------------
-- 14:
--This will be more accurate by filtering 14 days. It takes really long time to display the result
WITH GainLoss AS (
    SELECT Brand_Name, Date, [Close],
        LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PrevClose
    FROM dbo.StockData
),
ComputedChange AS (
    SELECT Brand_Name, Date, [Close],
        IIF([Close] - PrevClose > 0, [Close] - PrevClose, 0) AS Gain,
        IIF([Close] - PrevClose < 0, ABS([Close] - PrevClose), 0) AS Loss
    FROM GainLoss
    WHERE PrevClose IS NOT NULL
),
Averages AS (
    SELECT Brand_Name, Date, [Close],
        AVG(Gain) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS AvgGain,
        AVG(Loss) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS AvgLoss
    FROM ComputedChange
),
RSI AS (
    SELECT Brand_Name, Date, [Close], AvgGain, AvgLoss,
        CASE 
            WHEN AvgLoss = 0 THEN 100
            ELSE ROUND(100 - (100 / (1 + (AvgGain / AvgLoss))), 2)
        END AS RSI_14
    FROM Averages
)
SELECT Brand_Name, Date, [Close],
    ROUND(AvgGain, 2) AS Avg_Gain,
    ROUND(AvgLoss, 2) AS Avg_Loss,
    RSI_14,
    CASE 
        WHEN RSI_14 > 70 THEN 'RSI > 70 (Overbought)'
        WHEN RSI_14 < 30 THEN 'RSI < 30 (Oversold)'
    END AS Signal
FROM RSI
WHERE RSI_14 > 70 OR RSI_14 < 30 
      AND Brand_Name = 'apple' AND YEAR(Date) = 2024 -- shrink the datatset
ORDER BY Brand_Name  , Date
--This will be not guarantee because filtering 14 days by 14 consecutive rows. (display result quickly)
WITH PriceChange AS (
    SELECT  
        Brand_Name, 
        Date, 
        [Close],
        LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PrevClose,
        [Close] - LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Change
    FROM dbo.StockData
),
GainLoss AS (
    SELECT *,
        CASE WHEN Change > 0 THEN Change ELSE 0 END AS Gain,
        CASE WHEN Change < 0 THEN ABS(Change) ELSE 0 END AS Loss
    FROM PriceChange
    WHERE PrevClose IS NOT NULL 
),
RollingAvg AS (
    SELECT 
        Brand_Name,
        Date,
        [Close],
        AVG(Gain) OVER (PARTITION BY Brand_Name ORDER BY Date 
                        ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS AvgGain,
        AVG(Loss) OVER (PARTITION BY Brand_Name ORDER BY Date 
                        ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS AvgLoss
    FROM GainLoss 
)
,RSI_Calc AS (
    SELECT *,
        CASE 
            WHEN AvgLoss = 0 THEN 100
            ELSE ROUND(100 - (100 / (1 + (AvgGain / AvgLoss))), 2)
        END AS RSI_14
    FROM RollingAvg
)
SELECT  Brand_Name, Date, [Close],
    ROUND(AvgGain, 2) AS Avg_Gain,
    ROUND(AvgLoss, 2) AS Avg_Loss,
    RSI_14,
    CASE 
        WHEN RSI_14 > 70 THEN 'RSI > 70 (Overbought)'
        WHEN RSI_14 < 30 THEN 'RSI < 30 (Oversold)'
        ELSE NULL
    END AS Signal
FROM RSI_Calc
WHERE RSI_14 > 70 OR RSI_14 < 30 
              AND Brand_Name = 'apple' AND YEAR(Date) = 2024 -- shrink the datatset
ORDER BY Brand_Name, Date;

-- 15:       (THIS TAKES A LONG TIME TO RUN THE CODE - shrinking the dataset to check  the answer by additionnal conditions  )

-- Step-by-step MACD and Signal Line Calculation
-- MACD = EMA(12) - EMA(26)
-- Signal Line = EMA(9) of MACD
-- Step 1: Calculate 12-day and 26-day EMA
WITH PriceWithEMA AS (
    SELECT 
        Brand_Name,
        Date,
        [Close],
        
        -- Calculate 12-day EMA using recursive logic
        CAST(NULL AS FLOAT) AS EMA12,
        CAST(NULL AS FLOAT) AS EMA26
    FROM dbo.StockData
)
-- The recursive CTE will initialize EMA using SMA and then compute EMA iteratively
, InitEMA AS (
    SELECT 
        Brand_Name, Date, [Close],
        AVG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS EMA12_Init,
        AVG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 25 PRECEDING AND CURRENT ROW) AS EMA26_Init,
        ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY Date) AS rn
    FROM dbo.StockData
)
, RecursiveEMA AS (
    SELECT 
        Brand_Name, Date, [Close],
        EMA12_Init AS EMA12,
        EMA26_Init AS EMA26,
        rn
    FROM InitEMA
    WHERE rn = 26 -- start at the first day where both EMAs can be initialized

    UNION ALL

    SELECT 
        s.Brand_Name, s.Date, s.[Close],
        ((s.[Close] - r.EMA12) * (2.0 / (12 + 1))) + r.EMA12,
        ((s.[Close] - r.EMA26) * (2.0 / (26 + 1))) + r.EMA26,
        s.rn
    FROM InitEMA s
    JOIN RecursiveEMA r
      ON s.Brand_Name = r.Brand_Name AND s.rn = r.rn + 1
)
-- Now compute MACD and Signal Line
, MACDLine AS (
    SELECT 
        Brand_Name, Date, [Close], EMA12, EMA26,
        EMA12 - EMA26 AS MACD
    FROM RecursiveEMA
)
, SignalLine AS (
    SELECT *,
        AVG(MACD) OVER (PARTITION BY Brand_Name ORDER BY Date ROWS BETWEEN 8 PRECEDING AND CURRENT ROW) AS Signal
    FROM MACDLine
)
-- Final result with bullish crossover detection
SELECT *,
    LAG(MACD) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PrevMACD,
    LAG(Signal) OVER (PARTITION BY Brand_Name ORDER BY Date) AS PrevSignal,
    CASE 
        WHEN LAG(MACD) OVER (PARTITION BY Brand_Name ORDER BY Date) < LAG(Signal) OVER (PARTITION BY Brand_Name ORDER BY Date)
         AND MACD > Signal THEN 'Bullish Crossover'
        ELSE NULL
    END AS BullishSignal
FROM SignalLine 
WHERE Brand_Name = 'apple' AND YEAR(Date) = 2024 -- shrink the datatset
OPTION (MAXRECURSION 0);


-- 16:
WITH Calculate_SMA_and_SD AS (
  SELECT 
    d1.Brand_Name, 
    d1.Date,
    AVG(d2.[Close]) AS Avg_Close_20Day,
    STDEV(d2.[Close]) AS SD_20Day
FROM 
    dbo.StockData AS d1
JOIN 
    dbo.StockData AS d2 ON d1.Brand_Name = d2.Brand_Name AND d2.Date 
                          BETWEEN DATEADD(DAY, -20, d1.Date) AND DATEADD(DAY, -1, d1.Date) 
GROUP BY  d1.Brand_Name, d1.Date
--HAVING  AVG(d2.[Close]) IS NOT NULL AND  STDEV(d2.[Close]) IS NOT NULL
)
, Bollinger_Bands AS (
  SELECT Brand_Name, Date, 
      Avg_Close_20Day +( 2 *  SD_20Day ) AS Upper_band, 
      Avg_Close_20Day -( 2 *  SD_20Day ) AS Lower_band,
       Avg_Close_20Day +( 2 *  SD_20Day ) - Avg_Close_20Day -( 2 *  SD_20Day ) AS Band_Width
  FROM Calculate_SMA_and_SD
)

SELECT bb1.Brand_Name, bb1.Date, bb1.Band_Width,
  MIN(bb2.Band_Width) AS min_BW_in_pre_20days,
  CASE 
    WHEN bb1.Band_Width <= MIN(bb2.Band_Width) THEN 1
    ELSE 0
  END AS IsSqueeze
FROM Bollinger_Bands AS bb1
JOIN Bollinger_Bands AS bb2 
  ON bb1.Brand_Name = bb2.Brand_Name
 AND bb2.Date BETWEEN DATEADD(DAY, -20, bb1.Date) AND DATEADD(DAY, -1, bb1.Date)
WHERE YEAR(bb1.Date) BETWEEN 2015 AND 2025 AND bb1.Brand_Name = 'apple'
GROUP BY bb1.Brand_Name, bb1.Date, bb1.Band_Width
ORDER BY bb1.Date;


-- 17
WITH Calculate_LowHigh AS (
  SELECT d1.Brand_Name, d1.Date, d1.[Close], 
            MIN(d2.Low) AS MinLow_14Day, 
            MAX(d2.High) AS MaxHigh_14Day
  FROM dbo.StockData AS d1
  JOIN dbo.StockData  AS d2
  ON d1.Brand_Name = d2.Brand_Name 
    AND d2.Date BETWEEN DATEADD(DAY, -14, d1.Date) AND DATEADD(DAY, -1, d1.Date)
  GROUP BY d1.Brand_Name, d1.Date, d1.[Close]
)
, Calculate_Percent_K AS(
   SELECT Brand_Name, Date , 
                  ([Close] - MinLow_14Day )  * 100 /  (MaxHigh_14Day - MinLow_14Day) AS Percent_K
   FROM Calculate_LowHigh
)
, Calculate_Percent_D AS(
  SELECT k1.Brand_Name, k1.Date, k1.Percent_K,
        AVG(k2.Percent_K)   AS Percent_D
  FROM Calculate_Percent_K AS k1
  JOIN Calculate_Percent_K  AS k2
  ON k1.Brand_Name = k2.Brand_Name 
  AND k2.Date BETWEEN DATEADD(DAY, -2, k1.Date) AND k1.Date
  GROUP BY k1.Brand_Name, k1.Date, k1.Percent_K
)
, Interpret_Signals AS(
  SELECT *, 
    CASE WHEN  Percent_K >80 OR Percent_D > 80 THEN 'overbought'
               WHEN  Percent_K <20 OR Percent_D < 20 THEN 'oversold'
                ELSE 'neither'
    END AS signals
    FROM Calculate_Percent_D
)
--Optional
, Optional_Add_ons AS(
  SELECT cur.Brand_Name, cur.Date, cur.Percent_K AS Current_Percent_K, cur.Percent_D AS Current_Percent_D, 
                  pre.Percent_K AS Prev_Percent_K, pre.Percent_D AS Prev_Percent_D,
                  CASE 
                    WHEN  pre.Percent_K < pre.Percent_D AND cur.Percent_K > cur.Percent_D THEN 'Bullish'
                    WHEN  pre.Percent_K > pre.Percent_D AND cur.Percent_K < cur.Percent_D THEN 'Bearish'
                    ELSE 'Neither'
                  END Add_ons
  FROM Calculate_Percent_D AS cur
  JOIN Calculate_Percent_D AS pre
  ON cur.Brand_Name = pre.Brand_Name AND 
        Pre.Date = DATEADD(DAY, -1, cur.Date) 
)
SELECT *
-- FROM Optional_Add_ons
FROM Interpret_Signals
WHERE Brand_Name = 'apple' AND YEAR(Date) = 2024
ORDER BY Brand_Name, Date;


---------------------------------------------📊 Event & Post-event Analysis-------------------------------------------------------
USE StockMarket
-- 18: 
SELECT Brand_Name, AVG(Close_Return) AS Avg_Close_Return 
FROM (
    SELECT Brand_Name, Date, Dividends, Announcement_Close, Close_After_5days,
          (Close_After_5days - Announcement_Close) * 100.0 / Announcement_Close AS Close_Return
    FROM (
        SELECT d1.Brand_Name, d1.Date, d1.Dividends, d1.[Close] AS Announcement_Close,
            (
                SELECT AVG(d2.[Close]) 
                FROM dbo.StockData AS d2
                WHERE d2.Brand_Name = d1.Brand_Name
                  AND d2.Date BETWEEN DATEADD(DAY, 1, d1.Date) AND DATEADD(DAY, 5, d1.Date)
            ) AS Close_After_5days
        FROM dbo.StockData AS d1 
        WHERE d1.Dividends != 0
    ) AS t
) AS t_out

WHERE Close_After_5days IS NOT NULL 
-- AND YEAR(Date) = 2024                            --Add time period if you want
-- AND Brand_Name = 'apple'
GROUP BY Brand_Name


-- 19:
WITH split_date AS (
  SELECT Brand_Name, Date AS latest_split_date, [Stock Splits],
         ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY Date DESC) AS rn
  FROM dbo.StockData
  WHERE [Stock Splits] != 0
)
-- Only keep the latest split per brand
, latest_split_only AS (
  SELECT Brand_Name, latest_split_date
  FROM split_date
  WHERE rn = 1
)
, before_60days AS (
  SELECT sd.Brand_Name, sd.latest_split_date, AVG((sd1.High - sd1.Low) / sd1.[Close])  AS avg_daily_volatility_before_60days
  FROM split_date AS sd
  JOIN dbo.StockData AS sd1 
  ON sd.Brand_Name = sd1.Brand_Name
  WHERE sd1.Date BETWEEN DATEADD(DAY, -60, sd.latest_split_date) AND DATEADD(DAY, -1, sd.latest_split_date) 
         AND sd1.[Close] != 0
  GROUP BY sd.Brand_Name, sd.latest_split_date
)
, after_60days AS (
  SELECT sd.Brand_Name, sd.latest_split_date, AVG((sd1.High - sd1.Low) / sd1.[Close] ) AS  avg_daily_volatility_after_60days
  FROM split_date AS sd
  JOIN dbo.StockData AS sd1 
  ON sd.Brand_Name = sd1.Brand_Name
  WHERE sd1.Date BETWEEN DATEADD(DAY, 1, sd.latest_split_date) AND DATEADD(DAY, 60, sd.latest_split_date) 
            AND sd1.[Close] != 0
  GROUP BY sd.Brand_Name, sd.latest_split_date
)
SELECT bd.Brand_Name, bd.latest_split_date, bd.avg_daily_volatility_before_60days, ad.avg_daily_volatility_after_60days,
(ad.avg_daily_volatility_after_60days - bd.avg_daily_volatility_before_60days) *100 / bd.avg_daily_volatility_before_60days AS percent_change_in_volatility
FROM  after_60days AS ad
JOIN before_60days AS bd
ON bd.Brand_Name = ad.Brand_Name AND bd.latest_split_date =ad.latest_split_date
ORDER BY percent_change_in_volatility DESC



-- 20
/*Apple (AAPL) had its most recent earnings event for the second quarter ending March 29, 2025, reported on May 1, 2025. The company announced financial results, including revenue and earnings per share, according to Apple. 
So, let's take March 29, 2025 as the earning date for all brand
*/
SELECT 
    b.Brand_Name,
    '2025-03-29' AS Earnings_Date,
    b.[Close] AS close_before_earning_date,
    a.[Close] AS close_after_earning_date,
    ROUND((a.[Close] - b.[Close]) * 100.0 / b.[Close], 2) AS percent_change
FROM dbo.StockData b
JOIN dbo.StockData a
    ON b.Brand_Name = a.Brand_Name
WHERE b.Date = DATEADD(DAY, -3, '2025-03-29')
  AND a.Date = DATEADD(DAY, 3, '2025-03-29');

-- 21
WITH PriceVolumeChange AS (
    SELECT  
        Brand_Name, Date, [Close], Volume,
        LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_Close,
        LAG(Volume) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_Volume
    FROM dbo.StockData
)
SELECT   
    Brand_Name, Date, [Close], Prev_Close,
    ROUND(([Close] - Prev_Close) * 100.0 / NULLIF(Prev_Close, 0), 2) AS Daily_Return_Percent,
    Volume, Prev_Volume,
    ROUND((Volume - Prev_Volume) * 100.0 / NULLIF(Prev_Volume, 0), 2) AS Volume_Change_Percent
FROM PriceVolumeChange
WHERE 
    Prev_Close IS NOT NULL AND Prev_Volume IS NOT NULL
    AND Prev_Close != 0 AND Prev_Volume != 0
    AND (
        ABS(([Close] - Prev_Close) * 100.0 / NULLIF(Prev_Close, 0)) > 10
        OR ((Volume - Prev_Volume) * 100.0 / NULLIF(Prev_Volume, 0)) > 50
    )
ORDER BY Date, Brand_Name

---------------------------------------------🧾 Portfolio & Risk Metrics-------------------------------------------------------

-- 22
WITH Daily_Returns AS (
    SELECT  
        Brand_Name, Date, [Close],
        LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_Close
    FROM dbo.StockData
),
Return_Calculated AS (
    SELECT  
        Brand_Name, Date, [Close], Prev_Close,
        CASE 
            WHEN Prev_Close != 0 THEN ROUND(([Close] - Prev_Close) * 100.0 / Prev_Close, 4)
            ELSE NULL
        END AS Daily_Return
    FROM Daily_Returns
    WHERE Prev_Close IS NOT NULL 
    --shrink the size of dataset to check the answer
    AND Brand_Name ='apple' 
    AND Date BETWEEN DATEADD(DAY, -89, GETDATE()) AND GETDATE()
),
Final_Volatility AS (
    SELECT  
        a.Brand_Name, a.Date, a.Daily_Return,
        (
            SELECT STDEV(b.Daily_Return)
            FROM Return_Calculated b
            WHERE b.Brand_Name = a.Brand_Name 
              AND b.Date BETWEEN DATEADD(DAY, -89, a.Date) AND a.Date
        ) AS Volatility_90day
    FROM Return_Calculated a
)
SELECT *
FROM Final_Volatility
WHERE Volatility_90day IS NOT NULL
ORDER BY Brand_Name, Date;


-- 23
--(Assuming 252 trading days in a year)
--            Sharpe Ratio = (Average Daily Return - Daily Risk - Free Rate) / Standard Deviation of Daily Returns
--Since our dataset doesn’t include a separate risk-free asset or rate per day, we manually assume the daily risk-free rate based on the provided annualized rate (2%).
--We can approximate it using a constant based on the 2% annualized rate. So,
--Daily Risk - Free Rate = 2% / 252
WITH Calculate_daily_return AS (
  SELECT * FROM (
    SELECT Brand_Name, Date, 
        ([Close] -  LAG([Close] ) OVER (PARTITION BY Brand_Name ORDER BY Date)) 
        /  NULLIF(LAG([Close] ) OVER (PARTITION BY Brand_Name ORDER BY Date), 0) AS daily_return
    FROM dbo.StockData
  ) AS t
  --WHERE Date BETWEEN DATEADD(MONTH, -6, GETDATE()) AND GETDATE()
      WHERE Date >= DATEADD(MONTH, -6, (SELECT MAX(Date) FROM dbo.StockData))

)
, Calculate_avg_and_standard_deviation_daily_return AS (
  SELECT Brand_Name, AVG(daily_return)  AS avg_daily_return,  
                  STDEV(daily_return) AS standard_deviation,
                  (2/100/252) AS Daily_Risk_Free_Rate
  FROM Calculate_daily_return
  GROUP BY Brand_Name
)
SELECT Brand_Name,  avg_daily_return, standard_deviation, 
              (avg_daily_return - Daily_Risk_Free_Rate) / standard_deviation AS Sharpe_Ratio,
              CASE 
                  WHEN (avg_daily_return - Daily_Risk_Free_Rate) / NULLIF(standard_deviation,0) >= 1 THEN 'Strong'
                  ELSE 'Weak'
              END AS Performance_Category,
              CASE 
                  WHEN standard_deviation >= 0.02 THEN 'Risky'
                  ELSE 'Stable'
              END AS Risk_Category
FROM Calculate_avg_and_standard_deviation_daily_return
ORDER BY Sharpe_Ratio DESC


-- 24
WITH FilteredData_and_RunningPeak AS (
    SELECT Brand_Name, Date, [Close],
                        MAX([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date 
                                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Running_Max_Close
    FROM dbo.StockData
    WHERE YEAR(Date) =2024
),
Drawdowns AS (
    SELECT Brand_Name, Date, [Close], Running_Max_Close,
        ROUND(([Close] - Running_Max_Close) * 100.0 / NULLIF(Running_Max_Close, 0), 2) AS Drawdown_Percent
    FROM FilteredData_and_RunningPeak
)
SELECT Brand_Name,
       MIN(Drawdown_Percent) AS Max_Drawdown_Percent_2024
FROM Drawdowns
GROUP BY Brand_Name
ORDER BY Max_Drawdown_Percent_2024 ASC;

-- 25
WITH Calculate_Daily_Return AS (
    SELECT * FROM (
        SELECT  Brand_Name,  Date, 
            ([Close] - LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date)) 
            / NULLIF(LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date), 0) AS daily_return
        FROM dbo.StockData
    ) AS t
    WHERE Date >= DATEADD(MONTH, -6, (SELECT MAX(Date) FROM dbo.StockData))
),
Avg_Returns AS (
    SELECT  Brand_Name,
        AVG(daily_return) AS avg_daily_return,
        (2.0 / 100 / 252) AS daily_risk_free_rate
    FROM Calculate_Daily_Return
    GROUP BY Brand_Name
),
Downside_Deviation AS (
    SELECT 
        Brand_Name,
        SQRT(AVG(POWER(CASE 
            WHEN daily_return < (2.0 / 100 / 252) THEN daily_return - (2.0 / 100 / 252) 
            ELSE 0 
        END, 2))) AS downside_deviation
    FROM Calculate_Daily_Return
    GROUP BY Brand_Name
),
Sortino_Calculated AS (
    SELECT  a.Brand_Name, avg_daily_return, daily_risk_free_rate, downside_deviation,
        (avg_daily_return - daily_risk_free_rate) / NULLIF(downside_deviation, 0) AS sortino_ratio
    FROM Avg_Returns a
    JOIN Downside_Deviation b ON a.Brand_Name = b.Brand_Name
)
SELECT 
    Brand_Name,
    ROUND(avg_daily_return, 6) AS avg_daily_return,
    ROUND(daily_risk_free_rate, 6) AS daily_risk_free_rate,
    ROUND(downside_deviation, 6) AS downside_deviation,
    ROUND(sortino_ratio, 3) AS sortino_ratio,
    CASE 
        WHEN sortino_ratio >= 1.5 THEN 'Strong & Stable'
        WHEN sortino_ratio >= 1.0 THEN 'Good'
        WHEN sortino_ratio >= 0.5 THEN 'Moderate'
        WHEN sortino_ratio >= 0 THEN 'Weak'
        ELSE 'Risky & Underperforming'
    END AS Risk_Performance
FROM Sortino_Calculated
ORDER BY sortino_ratio DESC

---------------------------------------------🕒 Time-Series Signal Detection-------------------------------------------------------

-- 26
-- Prepare base data with lag and lead values
WITH Base AS (
  SELECT  Brand_Name,  Date,   [Close],   Volume,
    LAG([Close], 2) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Close_2DaysAgo,
    LAG(Volume) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Volume_Yesterday,
    LEAD([Close], 2) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Close_2DaysLater,
    LEAD(Volume) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Volume_Tomorrow,
    LAG(Date, 2) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Date_2DaysAgo,
    LEAD(Date, 2) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Date_2DaysLater
  FROM dbo.StockData
)
-- Detect Lagging and Leading signals
, Signal_Detection AS (
  SELECT  Brand_Name, Date, [Close], Volume,
    Date_2DaysAgo AS Related_Date,
    'Lagging' AS Signal_Type,
    ROUND((Volume - Volume_Yesterday) * 100.0 / NULLIF(Volume_Yesterday, 0), 2) AS Volume_Change_Percent,
    ROUND(([Close] - Close_2DaysAgo) * 100.0 / NULLIF(Close_2DaysAgo, 0), 2) AS Price_Change_Percent
  FROM Base
  WHERE 
    Volume_Yesterday IS NOT NULL AND Close_2DaysAgo IS NOT NULL
    AND (Volume - Volume_Yesterday) * 100.0 / NULLIF(Volume_Yesterday, 0) > 100
    AND ABS(([Close] - Close_2DaysAgo) * 100.0 / NULLIF(Close_2DaysAgo, 0)) > 5

  UNION ALL

  SELECT  Brand_Name, Date, [Close], Volume,
    Date_2DaysLater AS Related_Date,
    'Leading' AS Signal_Type,
    ROUND((Volume_Tomorrow - Volume) * 100.0 / NULLIF(Volume, 0), 2) AS Volume_Change_Percent,
    ROUND((Close_2DaysLater - [Close]) * 100.0 / NULLIF([Close], 0), 2) AS Price_Change_Percent
  FROM Base
  WHERE 
    Volume_Tomorrow IS NOT NULL AND Close_2DaysLater IS NOT NULL
    AND (Volume_Tomorrow - Volume) * 100.0 / NULLIF(Volume, 0) > 100
    AND ABS((Close_2DaysLater - [Close]) * 100.0 / NULLIF([Close], 0)) > 5
)
SELECT *
FROM Signal_Detection
ORDER BY Brand_Name, Date;


-- 27
-- You can manually add holidays here (adjust years as needed)
WITH Holidays AS (
    SELECT 1 AS Month, 1 AS Day, 'New Year' AS Holiday_Name UNION
    SELECT 1, 15, 'MLK Day' UNION
    SELECT 2, 19, 'Presidents Day' UNION
    SELECT 5, 27, 'Memorial Day' UNION
    SELECT 7, 4, 'Independence Day' UNION
    SELECT 9, 2, 'Labor Day' UNION
    SELECT 11, 28, 'Thanksgiving' UNION
    SELECT 12, 25, 'Christmas'
),
Stock_With_Lag_Lead AS (
    SELECT  s.Brand_Name,  s.Date,
        LAG(s.[Close]) OVER (PARTITION BY s.Brand_Name ORDER BY s.Date) AS Prev_Close,
        s.[Close],
        LEAD(s.[Close]) OVER (PARTITION BY s.Brand_Name ORDER BY s.Date) AS Next_Close
    FROM dbo.StockData s
),
Holiday_Returns AS (
    SELECT  sw.Brand_Name, sw.Date,
        ROUND((sw.[Close] - sw.Prev_Close) * 100.0 / NULLIF(sw.Prev_Close, 0), 4) AS daily_return_before_holiday,
        ROUND((sw.Next_Close - sw.[Close]) * 100.0 / NULLIF(sw.[Close], 0), 4) AS daily_return_after_holiday
    FROM Stock_With_Lag_Lead sw
    JOIN Holidays h 
        ON (MONTH(DATEADD(DAY, 1, sw.Date)) = h.Month AND DAY(DATEADD(DAY, 1, sw.Date)) = h.Day)
        OR (MONTH(DATEADD(DAY, -1, sw.Date)) = h.Month AND DAY(DATEADD(DAY, -1, sw.Date)) = h.Day)
)
SELECT *, 
    ROUND((daily_return_before_holiday + daily_return_after_holiday) / 2, 4) AS avg_daily_return
FROM Holiday_Returns
ORDER BY Brand_Name, Date;


-- 28
WITH MondayFridayReturns AS (
    SELECT 
        Brand_Name, 
        Date,
        FORMAT(Date, 'dddd') AS Day_Name, 
        ([Close] - LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date)) 
            / NULLIF(LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date), 0) AS daily_return
    FROM dbo.StockData
)
SELECT 
    Brand_Name,
    YEAR(Date) AS Year,
    Day_Name,
    AVG(daily_return) AS avg_daily_return
FROM MondayFridayReturns
WHERE Day_Name IN ('Monday', 'Friday')
GROUP BY Brand_Name, YEAR(Date), Day_Name
ORDER BY Brand_Name, Year, Day_Name;


-- 29
WITH Returns AS (
  SELECT  Brand_Name, Date, YEAR(Date) AS Year,
    ([Close] - LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date)) 
      / NULLIF(LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date), 0) AS daily_return
  FROM dbo.StockData
),
QuarterEndDays AS (
  SELECT '03-31' AS day_month UNION
  SELECT '06-30' UNION
  SELECT '09-30' UNION
  SELECT '12-31'
),
LabeledReturns AS (
  SELECT  r.Brand_Name, r.Date, r.Year, r.daily_return,
    CASE 
      WHEN FORMAT(r.Date, 'MM-dd') IN (SELECT day_month FROM QuarterEndDays) 
      THEN 'QuarterEnd'
      ELSE 'NonQuarterEnd'
    END AS ReturnType
  FROM Returns r
),
GroupedReturns AS (
  SELECT  Brand_Name, Year, ReturnType, AVG(daily_return) AS avg_return
  FROM LabeledReturns
  GROUP BY Brand_Name, Year, ReturnType
)
SELECT  qe.Brand_Name, qe.Year, qe.avg_return AS quarter_end_return, nqe.avg_return AS non_quarter_end_return,
  CASE 
    WHEN (qe.avg_return - nqe.avg_return) / NULLIF(ABS(nqe.avg_return), 0) > 1 
    THEN 'Abnormal behavior'
    ELSE 'Normal behavior'
  END AS significance
FROM 
  (SELECT * FROM GroupedReturns WHERE ReturnType = 'QuarterEnd') qe
JOIN 
  (SELECT * FROM GroupedReturns WHERE ReturnType = 'NonQuarterEnd') nqe
  ON qe.Brand_Name = nqe.Brand_Name AND qe.Year = nqe.Year
ORDER BY qe.Brand_Name, qe.Year;



-- 30
WITH AddReturns AS (
  SELECT 
    Brand_Name, 
    Date,
    [Close],
    LAG([Close], 19) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Close_20_days_ago,
    FIRST_VALUE([Close]) OVER (
        PARTITION BY Brand_Name, DATEPART(YEAR, Date), DATEPART(WEEK, Date)
        ORDER BY Date
    ) AS Week_Open_Close
  FROM dbo.StockData
) SELECT * FROM AddReturns
,MomentumDetected AS (
  SELECT 
    Brand_Name,
    Date,
    ([Close] - Close_20_days_ago) * 100.0 / NULLIF(Close_20_days_ago, 0) AS Return_20days,
    ([Close] - Week_Open_Close) * 100.0 / NULLIF(Week_Open_Close, 0) AS Return_this_week
  FROM AddReturns
  WHERE Close_20_days_ago IS NOT NULL
)
SELECT *
FROM MomentumDetected
WHERE Return_20days > 5 AND Return_this_week > 0
ORDER BY Brand_Name, Date DESC



-------------------LOOK UP ALL THE COLUMNS, DATE TYPE------------------------------------------
SELECT  COLUMN_NAME,  DATA_TYPE,  CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'StockData' AND TABLE_SCHEMA = 'dbo';

USE StockMarket

SELECT * FROM dbo.StockData

WITH Daily_Returns AS (
    SELECT  
        Brand_Name, Date, [Close],
        LAG([Close]) OVER (PARTITION BY Brand_Name ORDER BY Date) AS Prev_Close
    FROM dbo.StockData
),
Return_Calculated AS (
    SELECT  
        Brand_Name, Date, [Close], Prev_Close,
        CASE 
            WHEN Prev_Close != 0 THEN ROUND(([Close] - Prev_Close) * 100.0 / Prev_Close, 4)
            ELSE NULL
        END AS Daily_Return
    FROM Daily_Returns
    WHERE Prev_Close IS NOT NULL 
    --shrink the size of dataset to check the answer
    AND Brand_Name ='apple' 
    AND Date BETWEEN DATEADD(DAY, -89, GETDATE()) AND GETDATE()
),
Final_Volatility AS (
    SELECT  
        a.Brand_Name, a.Date, a.Daily_Return,
        (
            SELECT STDEV(b.Daily_Return)
            FROM Return_Calculated b
            WHERE b.Brand_Name = a.Brand_Name 
              AND b.Date BETWEEN DATEADD(DAY, -89, a.Date) AND a.Date
        ) AS Volatility_90day
    FROM Return_Calculated a
)
SELECT *
FROM Final_Volatility
WHERE Volatility_90day IS NOT NULL
ORDER BY Brand_Name, Date;




-- Step 1: Add columns if they don't exist
IF COL_LENGTH('dbo.StockData', 'Previous_Close') IS NULL
    ALTER TABLE dbo.StockData ADD Previous_Close FLOAT;

IF COL_LENGTH('dbo.StockData', 'Daily_Return') IS NULL
    ALTER TABLE dbo.StockData ADD Daily_Return FLOAT;

-- Step 2: Use a CTE to calculate Previous_Close and Daily_Return
WITH Computed AS (
    SELECT 
        [Date],
        [Brand_Name],
        [Close],
        LAG([Close]) OVER (PARTITION BY [Brand_Name] ORDER BY [Date]) AS Previous_Close
    FROM dbo.StockData
)
-- Step 3: Update the table
UPDATE S
SET 
    S.Previous_Close = C.Previous_Close,
    S.Daily_Return = 
        CASE 
            WHEN C.Previous_Close IS NOT NULL AND C.Previous_Close != 0 
            THEN (C.[Close] - C.Previous_Close) / C.Previous_Close
            ELSE NULL
        END
FROM dbo.StockData S
INNER JOIN Computed C
    ON S.[Date] = C.[Date]
   AND S.[Brand_Name] = C.[Brand_Name];


SELECT DISTINCT [Brand_Name]
FROM dbo.StockData




-- Create destination table
CREATE TABLE dbo.EMA_10_Results (
    Date DATE,
    Brand_Name VARCHAR(255),
    [Close] FLOAT,
    ema_10 FLOAT
);
-- Parameters
DECLARE @period INT = 10;
DECLARE @multiplier FLOAT = 2.0 / (@period + 1.0);

-- Base data with row numbers
WITH base_data AS (
    SELECT 
        Date,
        Brand_Name,
        [Close],
        ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY Date) AS rn
    FROM dbo.StockData
),
-- Recursive CTE for EMA
ema_recursive AS (
    -- Anchor row
    SELECT
        b.Date,
        b.Brand_Name,
        b.[Close],
        b.rn,
        CAST(b.[Close] AS FLOAT) AS ema
    FROM base_data b
    WHERE b.rn = 1

    UNION ALL

    -- Recursive step
    SELECT
        b.Date,
        b.Brand_Name,
        b.[Close],
        b.rn,
        CAST((b.[Close] - e.ema) * @multiplier + e.ema AS FLOAT) AS ema
    FROM base_data b
    INNER JOIN ema_recursive e
        ON b.Brand_Name = e.Brand_Name AND b.rn = e.rn + 1
)

-- Insert the result into table
INSERT INTO dbo.EMA_10_Results (Date, Brand_Name, [Close], ema_10)
SELECT Date, Brand_Name, [Close], ema
FROM ema_recursive
ORDER BY Brand_Name, Date
OPTION (MAXRECURSION 0);