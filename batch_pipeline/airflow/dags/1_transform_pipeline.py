import datetime

from airflow import DAG
from airflow.operators.bash_operator import BashOperator

default_args = {"owner": "airflow"}

with DAG(
    dag_id="1_transform_pipeline",
    start_date=datetime.datetime(2020, 2, 2),
    schedule_interval=None,
    default_args=default_args,
    catchup=False,
) as dag:
	dbt_snapshot = BashOperator(
            task_id= 'dbt_run_snapshot',
            bash_command='cd $AIRFLOW_HOME/dags/dbt && dbt snapshot --profiles-dir $AIRFLOW_HOME/dags/dbt',
        )

	dbt_load_pageview_materialize = BashOperator(
            task_id= 'dbt_run_materialize_raw_pageview',
            bash_command='cd $AIRFLOW_HOME/dags/dbt && dbt run --profiles-dir $AIRFLOW_HOME/dags/dbt --models tag:pageview_materialize',
        )

	dbt_load_published_all_time = BashOperator(
            task_id= 'dbt_run_materialize_pub_all_time',
            bash_command='cd $AIRFLOW_HOME/dags/dbt && dbt run --profiles-dir $AIRFLOW_HOME/dags/dbt --models tag:all_time',
        )

	dbt_load_published_most_recent = BashOperator(
            task_id= 'dbt_run_materialize_pub_most_recent',
            bash_command='cd $AIRFLOW_HOME/dags/dbt && dbt run --profiles-dir $AIRFLOW_HOME/dags/dbt --models tag:most_recent',
        )

	dbt_snapshot >> dbt_load_published_most_recent
	dbt_load_pageview_materialize >> dbt_load_published_most_recent
	dbt_snapshot >> dbt_load_published_all_time
	dbt_load_pageview_materialize >> dbt_load_published_all_time