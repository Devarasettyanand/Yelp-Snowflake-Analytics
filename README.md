# Yelp Business Reviews Data Analytics on Snowflake

## Project Overview

This project demonstrates an end-to-end data analytics workflow using **Snowflake**, focusing on the Yelp Business Reviews dataset. 
The goal was to build a robust data pipeline to ingest, transform, and analyze a large volume of semi-structured JSON data, ultimately deriving valuable business insights.

This project showcases my skills in:
-   **Cloud Data Warehousing**: Leveraging Snowflake's architecture for scalable data storage and processing.
-   **ETL/ELT**: Implementing a pipeline to load raw data and transform it using SQL and Python.
-   **Data Modeling**: Designing a logical schema to support complex analytical queries.
-   **Advanced SQL**: Writing complex queries with CTEs, window functions, and `QUALIFY`.
-   **Serverless Computing**: Utilizing Snowflake's Python User-Defined Functions (UDFs) for custom logic like sentiment analysis.

## Technology Stack

| Component | Technology | Description |
| :--- | :--- | :--- |
| **Data Warehouse** | ❄️ **Snowflake** | The central platform for all data ingestion, storage, and processing. |
| **Data Source** | ☁️ **AWS S3** | Source of the raw Yelp business reviews and metadata in JSON format. |
| **Data Transformation** | 💻 **SQL** & 🐍 **Python** | Used for data parsing, cleaning, and custom sentiment analysis. |

## Project Workflow

1.  **Data Ingestion**: Raw JSON data from AWS S3 was loaded directly into Snowflake using the `COPY INTO` command. This leveraged Snowflake's ability to handle semi-structured data efficiently.

2.  **Data Transformation**: The raw JSON data was parsed and flattened into structured tables (`tbl_yelp_reviews`, `tbl_yelp_business`) using Snowflake's built-in functions.
3.  This process involved extracting specific fields and casting them to appropriate data types.

4.  **Sentiment Analysis**: A Python User-Defined Function (UDF) was created within Snowflake to perform sentiment analysis on the review text. This UDF, using the `TextBlob` package, classifies each review as 'positive', 'negative', or 'neutral'.

5.  **Data Analysis**: A series of analytical queries were executed to answer key business questions. These queries demonstrate proficiency in advanced SQL techniques for data aggregation, ranking, and segmentation.

## Key Business Insights & Findings

The project successfully generated several key insights, including:

* **Top Categories**: Identified the most common business categories based on review counts.
* **User Behavior**: Found the top users who contribute the most reviews in specific categories like 'Restaurants'.
* **Business Performance**: Calculated the percentage of 5-star reviews and average ratings for businesses with high review volume.
* **Temporal Trends**: Analyzed the monthly review volume to identify peak seasons for customer engagement.
* **Geographic Analysis**: Identified the top-reviewed businesses in major cities, showcasing regional popularity.

## How to Run the Project

1.  **Snowflake Account**: Ensure you have a Snowflake account with the necessary permissions.
2.  **Clone the Repository**: `git clone https://github.com/your-username/Yelp-Snowflake-Analytics.git`
3.  **Execute SQL Scripts**: Run the SQL files in the `sql/` directory in the following order:
    * `01_data_ingestion.sql`
    * `02_sentiment_analysis_udf.sql`
    * `03_analytical_queries.sql`
