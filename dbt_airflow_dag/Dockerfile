FROM quay.io/astronomer/astro-runtime:12.6.0

USER root

# Install necessary dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install python3-distutils

# Create virtual environment and install dbt-snowflake
RUN python -m venv dbt_venv && \
    dbt_venv/bin/pip install --no-cache-dir dbt-snowflake==0.20.0
    
USER astro