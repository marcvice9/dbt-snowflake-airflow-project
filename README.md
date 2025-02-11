# Project Description

This project implements a scalable data pipeline that converts raw data from Snowflake into curated data marts, leveraging dbt for transformations, Snowflake as the data warehouse, and Apache Airflow for orchestration via Astronomer's Cosmos.

![image](https://github.com/user-attachments/assets/5bc9a290-82d9-4b1f-9d30-49652e31890d)


# Technologies Used
- **Data Warehouse:** Snowflake
- **Transformation**: dbt core
- **Containarization:** Docker
- **Workflow orchestration**: Airflow, Astronomer's Cosmos
- **Languages**: SQL, Python, Bash


# 1. Data Ingestion

Defining external data source that exists in Snowflake. It includes tests to ensure that all values are distinct, not null and that validates the referential integrity through a relationship test.
![image](https://github.com/user-attachments/assets/ff6ffd62-24cc-4f88-b206-77b58cf8febc)


# 2. Data Transformation
## Bronze Layer
Data Source: Snowflake Sample Data - TPC-H dataset. Purpose: Preserve raw data as-is for reference and auditing.
![image](https://github.com/user-attachments/assets/e1a2d121-f0d9-48aa-99cd-7c10309eac98)

## Silver Layer

![image](https://github.com/user-attachments/assets/82bee4f7-0ccf-4e51-b80f-85decdcadcac)

### **Data Quality Generic Tests**:
It includes tests to ensure that all values are distinct, not null and that validates the referential integrity through a relationship test.

## Golden Layer
![image](https://github.com/user-attachments/assets/16fafa24-6fbc-422d-962b-d4ae70fd1e03)

### DBT Macros
Implemented re-usable business logic leveraging dbt macros. This business logic calculated the discounted amount based on a given extended_price and discount_percentage. 
![image](https://github.com/user-attachments/assets/7358fb31-da21-426a-a4e0-f15f9359aff7)

### **Data Quality Unit Tests**:
- **Date Range Test**: Flags any rows where order_date is in the future or before 1990 (likely invalid data).
- **Discount Amount Test**: Identifies orders where item_discount_amount is greater than zero, checking for incorrect discounts.

![image](https://github.com/user-attachments/assets/2f3a780a-b85c-4adb-a8fb-36da9b519f45)


# 3. Data Warehouse

Storage for both raw and transformed data.

![image](https://github.com/user-attachments/assets/2656d8cf-5b28-4224-9cad-2e4235e6b74b)


# 4. Data Pipeline

![image](https://github.com/user-attachments/assets/71050d84-61f3-4fd7-bcf8-3277d956d61c)

My pipeline fetches the data from source, apply modeling and transformation then loads it to Snowflake.

All steps are orchestrated in Airflow.

## Pipeline Automation

![image](https://github.com/user-attachments/assets/31f76b86-2869-42bb-a951-a919a548475d)



# Reproducibility
## 1. Environment Setup
- Install the necessary tools: dbt, Snowflake, and Apache Airflow.
- Configure your machine with the required credentials for Snowflake access.

## 2. Snowflake Database Preparation
- Load the TPC-H sample dataset into Snowflake.
- Ensure the database, schema, and warehouse are properly configured.

## 3. dbt Configuration
- Create a profiles.yml file to establish a connection between dbt and Snowflake.
- Organize the dbt project into the appropriate directories: models, macros, and tests.

## 4. Executing dbt Models
- Follow a structured pipeline:
      Raw (bronze) layer → Staging (silver) layer → Marts (gold) layer.
- Conduct thorough data validation to maintain accuracy.

## 5. Airflow and Cosmos Integration
- Set up Airflow connections for Snowflake and other dependencies.
- Use Astronomer’s Cosmos to streamline and automate dbt workflow orchestration.

## 6. Running the ETL Workflow
- Utilize the Airflow UI to monitor and trigger DAGs.
- Let Cosmos handle the orchestration, automatically generating Airflow DAGs from dbt workflows.

# Improvements
## Enhanced Testing:
- Add more singular tests for specific business logic validations.
- Implement alerting for failed tests or pipeline failures using Airflow email operators.

## Advanced Analytics:
- Incorporating snowflake snowpark for more advanced analytics

# Visualization:

Integrate BI tools like Tableau or Power BI to visualize marts/golden data.
