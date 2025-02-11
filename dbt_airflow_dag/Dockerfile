FROM quay.io/astronomer/astro-runtime:12.6.0

USER root

# Install necessary dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Create virtual environment and install dbt-snowflake
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake==1.9.0 && deactivate
    
USER astro