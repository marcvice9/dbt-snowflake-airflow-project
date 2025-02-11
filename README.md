# Project Description

This project implements a scalable data pipeline that converts raw data from Snowflake into curated data marts, leveraging dbt for transformations, Snowflake as the data warehouse, and Apache Airflow for orchestration via Astronomer's Cosmos.

![image](https://github.com/user-attachments/assets/5bc9a290-82d9-4b1f-9d30-49652e31890d)


# Technologies Used
Data Warehouse: Snowflake
Transformation: dbt
Containarization: Docker
Workflow orchestration: Airflow, Astronomer's Cosmos


# 1. Data Ingestion

Defining external data source that exists in Snowflake. It includes tests to ensure that all values are distinct, not null and that validates the referential integrity through a relationship test.
![image](https://github.com/user-attachments/assets/ff6ffd62-24cc-4f88-b206-77b58cf8febc)


# 2. Data Transformation
## Bronze Layer
Data Source: Snowflake Sample Data - TPC-H dataset. Purpose: Preserve raw data as-is for reference and auditing.
![image](https://github.com/user-attachments/assets/e1a2d121-f0d9-48aa-99cd-7c10309eac98)

## Silver Layer

![image](https://github.com/user-attachments/assets/82bee4f7-0ccf-4e51-b80f-85decdcadcac)


## Golden Layer
![image](https://github.com/user-attachments/assets/16fafa24-6fbc-422d-962b-d4ae70fd1e03)

# Generic & Unit Tests

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
Set Up the Environment: Install required tools: dbt, Snowflake, and Apache Airflow. Configure your machine with the necessary credentials to access Snowflake. Prepare Snowflake Database

Load the TPC-H sample data into Snowflake. Ensure database, schema, and warehouse settings are properly configured. Configure dbt

Set up a profiles.yml file to connect dbt to your Snowflake account. Place the dbt project files in the correct directory structure: models, macros, and tests. Run dbt Models

Start with the raw (bronze) layer, progress to the staging (silver) layer, and finally build the marts (golden) layer. Perform testing to ensure data accuracy.

Configure Airflow and Cosmos: Set up the necessary Airflow connections for Snowflake and other dependencies. Integrate Cosmos to manage dbt workflows efficiently.

Run the ETL Workflow: Use the Airflow UI to monitor and trigger DAGs. Cosmos handles the orchestration, automatically generating Airflow DAGs from dbt workflows.


# Improvements
## Enhanced Testing:
- Add more singular tests for specific business logic validations.
- Implement alerting for failed tests or pipeline failures using Airflow email operators.

## Advanced Analytics:
- Incorporating snowflake snowpark for more advanced analytics

# Visualization:

Integrate BI tools like Tableau or Power BI to visualize marts/golden data.
