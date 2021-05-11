
      delete
    from "checkout"."published_data"."all_time_postcode_user_pageviews_by_month"
    where (sk_atpupm) in (
        select (sk_atpupm)
        from "all_time_postcode_user_pageviews_by_month__dbt_tmp175823831494"
    );

    insert into "checkout"."published_data"."all_time_postcode_user_pageviews_by_month" ("sk_atpupm", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_atpupm", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "all_time_postcode_user_pageviews_by_month__dbt_tmp175823831494"
    );
  