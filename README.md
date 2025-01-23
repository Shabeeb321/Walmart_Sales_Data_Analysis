# Walmart Sales Data Analysis: End-to-End Project Using PostgreSQL & Python

## Project Overview



This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. I utilized Python for data processing and analysis, PostgreSQL for advanced querying, and structured problem-solving techniques to solve key business questions. 

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, PostgreSQL
   - **Goal**: To create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtained the Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to the profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Placed the downloaded `kaggle.json` file in my local `.kaggle` folder.
      - Used the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into my project.

### 3. Download Walmart Sales Data
   - **Data Source**: Used the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Saved the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Installed necessary Python libraries using:
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conducted an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Used functions such as `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identified and removed duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Dropped rows or columns with missing values if they are insignificant; filled values where essential.
   - **Fix Data Types**: Ensured all columns have consistent data types (e.g., unit_price as `float`).
   - **Currency Formatting**: Used `.replace()` to handle and format currency values for analysis.
   - **Validation**: Checked for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculated the `Total` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Added this calculated field to streamline further SQL analysis and aggregation tasks.

### 8. Load Data into PostgreSQL
   - **Set Up Connections**: Connected to PostgreSQL and loaded the cleaned data into each database.
   - **Table Creation**: Set up tables in PostgreSQL to automate data insertion.
   - **Verification**: Ran initial SQL queries to confirm that the data has been loaded accurately.

### 9. PostgreSQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Wrote and executed complex queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Kept clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintained well-structured documentation of the entire process in Jupyter Notebook.
   - **Project Publishing**: Published the completed project on GitHub, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks.
     - PostgreSQL query scripts.
     - Data files. 

---

## Requirements

- **Python 3.8+**
- **Databases**: PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)


---


## Results and Insights

This section will include my analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---


