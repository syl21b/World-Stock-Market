# 📈 Stock Market Analysis & Forecasting Dashboard

A comprehensive Tableau dashboard project providing **in-depth analysis, behavioral insights, and predictive forecasting** of stock price movements, volume patterns, corporate actions, and technical signals across a multi-brand stock market dataset. This project empowers users to make more informed investment and trading decisions.

-----

## 🚀 Project Overview

This project is designed to be a one-stop solution for understanding stock market dynamics. It goes beyond mere historical reporting by integrating **24+ advanced financial metrics** categorized into crucial areas:

  * **Price Trends:** Uncovering long-term and short-term directional movements.
  * **Volume Patterns:** Analyzing trading activity to gauge market conviction.
  * **Dividends & Splits:** Understanding the impact of corporate actions on returns.
  * **Corporate Events:** Tracking significant company-specific changes.
  * **Behavioral Proxies:** Identifying human sentiment and trading psychology.
  * **Technical Indicators:** Utilizing established signals for market timing.
  * **Predictive Forecasting:** Leveraging Machine Learning to project future prices.

Built primarily using **SQL** for robust data preparation and complex calculations, combined with **Tableau** for powerful, interactive data storytelling and visualization, this project delivers end-to-end analytical capabilities.

-----

## 🧰 Tools & Technologies

  * **SQL (SQL Server)**: Employed for comprehensive data preprocessing, feature engineering, and complex calculations including window functions, Common Table Expressions (CTEs), and aggregation, ensuring data integrity and performance.
  * **Tableau Desktop / Tableau Public**: The core visualization tool used for designing interactive dashboards, charts, and incorporating various filters and parameters to allow dynamic exploration of data.
  * **Python (Pandas/Numpy/Scikit-learn/TensorFlow/Keras)**: Utilized (as indicated by LSTM, XGBoost, Random Forest models in forecasts) for advanced statistical analysis, machine learning model training (especially for the `Close Price Forecast` dashboard), and potentially for more intricate data manipulation or custom indicator calculations not easily done in SQL.
  * **GitHub**: Essential for project version control, collaboration, and showcasing the entire data analytics workflow.

-----

## 📊 Dashboard Themes & Deep Dive

This project features a suite of interconnected dashboards, each serving a specific analytical purpose:

| **Dashboard Name** | **Key Questions Answered & Insights Provided** | **Example Visualizations / Metrics** |
| :----------------- | :--------------------------------------------- | :---------------------------------- |
| **0. Dashboard Menu** | Provides an intuitive, interactive navigation hub to seamlessly jump between all analytical dashboards and summaries. | Interactive Buttons, Navigation Links |
| **1. Stock Performance** | **How do different companies' stock performances compare over various time intervals?** Offers a comprehensive overview of stock performance, enabling users to analyze trends and compare returns across multiple brands, industries, and customizable time intervals. Helps identify top gainers and understand overarching performance trends. | Rolling Returns, Multi-Stock Performance Comparison Charts, ROI by Timeframe |
| **2. Dividends & Stock Splits** | **How do dividends and stock splits affect short-term stock returns?** Explores the impact of corporate actions. Users can analyze payout history, frequency, and specific split events by brand, and understand the subsequent short-term stock price behavior. | Dividend Payout History, Split Impact Analysis, "Best Brands after Dividends" Bar Chart |
| **3. Movement and Trend** | **What are the daily price extremes, movements, and volume dynamics for various brands?** Provides a snapshot of daily stock behavior by analyzing high/low prices, average daily ranges, and trading volume to understand volatility and identify significant trend shifts. | OHLC Charts, Volume Bars, Daily Price Range Indicators |
| **4. Behavioral Patterns & Trends** | **How does investor behavior influence stock prices for a selected brand over time?** Detects emotion-driven trading opportunities and market risks by highlighting patterns like `buy-the-dip` signals, `panic selling` events, significant `volume spikes`, `volatility surges`, and `anchor gaps`. | Volume Spike Anomalies, Volatility Heatmaps, Buy/Sell Signal Indicators |
| **5. Company Metadata & Macro Insights** | **Which brands and sectors are the most profitable, and what's the global stock distribution?** Helps investors and analysts identify the most profitable brands and sectors, compare capital gains vs. dividends, and explore global stock distribution. Also tracks corporate evolutions like mergers or ticker changes. | Capital Gains by Industry, Global Stock Distribution Maps, Brand-level KPIs |
| **6. Technical Indicators** | **What are the key price action, volume, and technical patterns for a brand, and can they signal trading opportunities?** Visualizes essential technical indicators such as RSI (Relative Strength Index), VWAP (Volume-Weighted Average Price), rolling returns, Moving Average (MA) crossovers, and candlestick patterns (e.g., Bullish Engulfing, Bearish). Critical for spotting trading signals and gauging technical health. | RSI Charts, VWAP with "Sustained Buying", MA Crossover Signals, OHLC Candlestick with Bullish/Bearish labels, Gap Up/Down Analysis, Breakout After Inside Bar |
| **7. Close Price Forecast** | **Which machine learning model provides the most accurate forecast for future stock close prices?** Compares predictive outcomes from **LSTM**, **XGBoost**, and **Random Forest** models. Displays historical (blue line) and forecasted (orange line) close prices for a selected stock, allowing for direct evaluation of each model's predictive accuracy and trend outlooks. This dashboard is crucial for forward-looking investment strategies. | Line Charts showing Historical vs. Forecasted Prices for LSTM, XGBoost, and Random Forest Models |

-----

## ✅ Key Features

  * **Advanced Pattern Detection:** Identifies bullish engulfing patterns, moving average crossovers, panic selling, and high volatility clusters.
  * **Corporate Event Tracking:** Monitors dividends, stock splits, and ticker changes for comprehensive company insights.
  * **Performance Metrics:** Analyzes capital gains, "red days," and "gap ups/downs."
  * **Integrated Technical Analysis:** Includes RSI, rolling returns, VWAP, and price anchoring.
  * **Machine Learning Forecasts:** Provides data-driven predictions of future stock prices using state-of-the-art models (LSTM, XGBoost, Random Forest).
  * **Interactive & Customizable:** All dashboards are designed for user interactivity, allowing drill-downs and custom date/brand selections.

-----

## 📸 Dashboard Previews
<img width="800" alt="Screenshot 2025-06-18 at 16 04 13" src="https://github.com/user-attachments/assets/1c79e6da-e9e2-4d00-9912-0a57a08cb9d1" />
<img width="800" alt="Screenshot 2025-06-18 at 16 04 39" src="https://github.com/user-attachments/assets/594b26c6-e921-44f2-9c0d-079c846569ae" />
<img width="800" alt="Screenshot 2025-06-18 at 16 10 57" src="https://github.com/user-attachments/assets/886b1a21-7ca5-4f3f-9fd5-194e88db7b15" />
<img width="800" alt="Screenshot 2025-06-18 at 16 11 18" src="https://github.com/user-attachments/assets/32a6a96d-83c6-4b7f-9c47-28c80957f59d" />
<img width="800" alt="Screenshot 2025-06-18 at 16 20 58" src="https://github.com/user-attachments/assets/a25745c8-9659-4544-af60-6bceb96f88a3" />
<img width="800" alt="Screenshot 2025-06-18 at 16 27 40" src="https://github.com/user-attachments/assets/192c4f9c-02fc-4d38-9741-482997e9d746" />
<img width="800" alt="Screenshot 2025-06-18 at 16 35 38" src="https://github.com/user-attachments/assets/b58dc035-12d7-4931-b3b7-e4dc2cb75f94" />
<img width="800" alt="Screenshot 2025-06-18 at 16 36 06" src="https://github.com/user-attachments/assets/dfc762bc-71ec-43b0-8c16-ff5132434b20" />


-----

## 📌 Use Cases

This dashboard project is invaluable for various stakeholders:

  * **📊 For Data Analysts & Scientists:** A robust framework for pattern recognition, technical signal detection, and applying machine learning models to financial time series.
  * **🧠 For Investors & Traders:** Provides critical insights for volatility tracking, trend signals, identifying optimal entry/exit points, understanding price anchors, and validating predictive outlooks for more confident investment decisions.
  * **🔍 For Financial Researchers:** A rich dataset and visualization toolkit for conducting macro trend analysis, behavioral finance studies, and exploring the efficacy of various technical strategies.
  * **🎓 For Students & Learners:** An excellent practical example of applying SQL, Tableau, and machine learning for real-world financial data analysis.

-----

## 🧠 Insights Example

> "Our `Close Price Forecast` dashboard, using the LSTM model, accurately predicted Stock X's bullish run in Q3 2024, showing a +7% gain within a 5-day forecast window. Furthermore, analysis from the `Behavioral Patterns` dashboard revealed a `buy-the-dip` signal prior to this rally, reinforcing the predictive power when combining multiple analytical perspectives."

-----

## 🛠️ How to Use

To set up and interact with this powerful dashboard suite:

1.  **Clone the Repository:**
    `git clone https://github.com/YourUsername/YourRepoName.git`
2.  **Prepare Your Data:** Ensure you have access to a stock market dataset. The expected schema for the primary stock data table should include: `Ticker`, `Date`, `Open`, `Close`, `High`, `Low`, `Adj_Close`, `Volume`, `Dividends`, and `Split_Ratio`.
3.  **Connect Tableau:** Open the Tableau workbook and connect it to your SQL database (or CSV files if applicable) containing the stock data.
4.  **Run SQL Scripts:** Execute the provided SQL scripts (if any) to generate the necessary advanced financial metrics, calculated fields, and aggregate tables. These scripts leverage window functions and CTEs for efficient data preparation.
5.  **Load Dashboards:** The Tableau dashboards should automatically load, allowing you to interact with the visualizations, filter by brand, time interval, and explore the various analytical themes.

-----

## 📜 License

This project is open-source and available under the [MIT License](https://www.google.com/search?q=LICENSE).

-----

## 🙌 Acknowledgments

This project is inspired by real-world stock trading analysis methodologies, advanced pattern detection techniques, and robust market psychology studies. Special thanks to the open-source community for the invaluable tools and resources that made this project possible.

-----
