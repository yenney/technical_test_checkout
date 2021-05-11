

  create  table "checkout"."stage_data"."users_extract__dbt_tmp"
  as (
    select * from stage_data.users_extract
  );