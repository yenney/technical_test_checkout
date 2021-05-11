
      delete
    from "checkout"."published_data"."all_time_postcode_user_pageviews_by_hour"
    where (sk_atpuph) in (
        select (sk_atpuph)
        from "all_time_postcode_user_pageviews_by_hour__dbt_tmp175823902171"
    );

    insert into "checkout"."published_data"."all_time_postcode_user_pageviews_by_hour" ("sk_atpuph", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_atpuph", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "all_time_postcode_user_pageviews_by_hour__dbt_tmp175823902171"
    );
  