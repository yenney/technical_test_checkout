FROM ${AIRFLOW_IMAGE_NAME:-apache/airflow:2.0.2}
USER airflow

# Installing/adding dbt and pre-req for dbt to airflow image
RUN pip install --no-cache-dir --user agate==1.6.1 \
    && pip install --no-cache-dir --user dbt==0.19