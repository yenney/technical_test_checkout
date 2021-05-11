import datetime

from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.operators.bash_operator import BashOperator

default_args = {"owner": "airflow"}

with DAG(
    dag_id="0_initialize",
    start_date=datetime.datetime(2020, 2, 2),
    schedule_interval=None,
    default_args=default_args,
    catchup=False,
) as dag:
	create_schemas_tables = PostgresOperator(
	        task_id="initialize_checkout_database",
	        postgres_conn_id="postgres_checkout_db",
	        sql='checkout_init_db/db_init.sql',
	    )

	tmp_operator = BashOperator(
            task_id= 'install_dbt_packages',
            bash_command='cd $AIRFLOW_HOME/dags/dbt && dbt deps --profiles-dir $AIRFLOW_HOME/dags/dbt',
        )