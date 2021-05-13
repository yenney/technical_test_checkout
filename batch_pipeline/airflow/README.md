# SQL Pipeline

## Summary
- Full Docker containerized SQL Pipeline orchcastrated by Airflow 2.0 using a Postgres database
- SQL transformations executed using dbt 0.19
- Postgres 13 database used to run the pipeline and to hold all the data 
- Containzerized environment includes pgAdmin4 web interface to connect to and query Postgres database
- Export documents as Markdown, HTML and PDF

## Pre-Requisites
- Docker & Docker Compose >= v1.27.0 with a minimum configuration of atleast 4 gig of memory and 2 CPUs

### Airflow Instructions
Airflow environment uses standard Airflow 2.0 [Docker Hub image](https://hub.docker.com/r/apache/airflow) and has been customized to add dbt 0.19 to the Airflow environment image. Additionally a separate instance of Postgres 13 & pgAdmin4 has been added to Docker Compose file (please see Postgres Database Instructions below).

To create and run Airflow docker environment containers just run the following command:
```sh
docker-compose up -d
```

Docker will begin to run and download all required images and will then build and run all container environments.

Once Docker has completed running and has sucessfully started all containers you can access the Airflow environment by using the following url: **http://localhost:8080**

Once you access the Airflow environment you will be prompted to enter credentials, please use the following:
```
User: airflow
Password: airflow
```
Once logged in you will see the following Dags:
| Dag | Description |
| ------ | ------ |
| 0_initialize | Dag used to initilize Postgres database (Create schemas, tables) and load database with [sample data](https://github.com/yenney/technical_test_checkout/tree/main/batch_pipeline/airflow/sample_data) used to run pipeline. This Dag also install required dbt packages used in pipline run |
| 1_transform_pipeline | Dag used to run dbt transformation model used to transform and load Postgres database schemas|

To run pipline first enable by clicking the Pause/UnPause slider button then run the Dags in thier numerical sequential order **0_** then **1_**
 
### Postgres Database Instructions
Once pipline has completed running using the Airflow instructions above, you now have the ability to access and query all of the data (even prior to running Dags above) using [pgAdmin4](https://www.pgadmin.org/)

You can access the pgAdmin4 by using the following url: **http://localhost:8181**

Once you reach reach the login page you will be asked to enter a Username and Password. Please use the following credentials:
```
User: admin
Password: admin
```
Once you login, you should see the pgAdmin dashboard.
Now, to add the PostgreSQL server running as a Docker container, right click on Servers, and then go to **Create > Server…**

In the General tab, type in Docker within the server Name field.
Now, go to the Connection tab and type in **pgsql-server** as Host name/address, **5432** as Port, **checkout** as Maintenance database, **airflow** as Username, **airflow** as Password and check Save password? checkbox. Then, click on Save.

pgAdmin 4 should be connected to your PostgreSQL database. 
Now you have the ability to view and query all of the schemas and tables.
Here are some example querys you can run:

```sql
SELECT *
FROM published_data.all_time_postcode_user_pageviews_by_day

SELECT *
FROM published_data.all_time_postcode_user_pageviews_by_month
WHERE id = 52365

SELECT *
FROM raw_data.users_snapshot
```

