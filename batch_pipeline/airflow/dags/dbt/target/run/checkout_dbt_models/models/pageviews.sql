
      

    insert into "checkout"."raw_data"."pageviews" ("user_id", "timestamp", "url")
    (
       select "user_id", "timestamp", "url"
       from "pageviews__dbt_tmp175813577403"
    );
  