
      update "checkout"."raw_data"."users_snapshot"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "users_snapshot__dbt_tmp175813575828" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "checkout"."raw_data"."users_snapshot".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "checkout"."raw_data"."users_snapshot".dbt_valid_to is null;

    insert into "checkout"."raw_data"."users_snapshot" ("id", "postcode", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."id",DBT_INTERNAL_SOURCE."postcode",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "users_snapshot__dbt_tmp175813575828" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  