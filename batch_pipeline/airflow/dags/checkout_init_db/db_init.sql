CREATE SCHEMA IF NOT EXISTS stage_data AUTHORIZATION airflow;
CREATE SCHEMA IF NOT EXISTS raw_data AUTHORIZATION airflow;
CREATE SCHEMA IF NOT EXISTS published_data AUTHORIZATION airflow;

CREATE TABLE IF NOT EXISTS stage_data.pageviews_extract
(
 user_id   int NOT NULL,
 "timestamp" timestamp NOT NULL DEFAULT NOW(),
 url       text NOT NULL

);

ALTER TABLE stage_data.pageviews_extract
    OWNER to airflow;

SET TIMEZONE='Europe/Moscow';

COPY stage_data.pageviews_extract (user_id, url) FROM '/sample_data/pagesviews.csv' DELIMITER '|' CSV;

SET TIMEZONE='UTC';

CREATE TABLE IF NOT EXISTS stage_data.users_extract
(
 "id"       int NOT NULL,
 postcode varchar(20) NOT NULL,
 CONSTRAINT PK_users_extract PRIMARY KEY ( "id" )
);

ALTER TABLE stage_data.users_extract
    OWNER to airflow;

COPY stage_data.users_extract FROM '/sample_data/users_extract.csv' DELIMITER '|' CSV;

CREATE TABLE IF NOT EXISTS raw_data.pageviews
(
    user_id integer,
    "timestamp" timestamp without time zone,
    url text COLLATE pg_catalog."default"
);

ALTER TABLE raw_data.pageviews
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS raw_data.users_snapshot
(
    id integer,
    postcode character varying(20) COLLATE pg_catalog."default",
    dbt_scd_id text COLLATE pg_catalog."default",
    dbt_updated_at timestamp without time zone,
    dbt_valid_from timestamp without time zone,
    dbt_valid_to timestamp without time zone
);

ALTER TABLE raw_data.users_snapshot
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.all_time_postcode_user_pageviews
(
    sk_atpup text COLLATE pg_catalog."default",
    id integer,
    pageview_dt timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.all_time_postcode_user_pageviews
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.all_time_postcode_user_pageviews_by_day
(
    sk_atpupd text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.all_time_postcode_user_pageviews_by_day
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.all_time_postcode_user_pageviews_by_hour
(
    sk_atpuph text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.all_time_postcode_user_pageviews_by_hour
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.all_time_postcode_user_pageviews_by_month
(
    sk_atpupm text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.all_time_postcode_user_pageviews_by_month
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.all_time_postcode_user_pageviews_by_year
(
    sk_atpupy text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.all_time_postcode_user_pageviews_by_year
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.most_recent_postcode_user_pageviews
(
    sk_mrpup text COLLATE pg_catalog."default",
    id integer,
    pageview_dt timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.most_recent_postcode_user_pageviews
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.most_recent_postcode_user_pageviews_by_day
(
    sk_mrpupd text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.most_recent_postcode_user_pageviews_by_day
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.most_recent_postcode_user_pageviews_by_hour
(
    sk_mrpuph text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.most_recent_postcode_user_pageviews_by_hour
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.most_recent_postcode_user_pageviews_by_month
(
    sk_mrpupm text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.most_recent_postcode_user_pageviews_by_month
    OWNER to airflow;

CREATE TABLE IF NOT EXISTS published_data.most_recent_postcode_user_pageviews_by_year
(
    sk_mrpupy text COLLATE pg_catalog."default",
    id integer,
    pageview_hour timestamp without time zone,
    postcode character varying(20) COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    total_pageviews bigint
);

ALTER TABLE published_data.most_recent_postcode_user_pageviews_by_year
    OWNER to airflow;