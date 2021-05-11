
      delete
    from "checkout"."published_data"."most_recent_postcode_user_pageviews_by_month"
    where (sk_mrpupm) in (
        select (sk_mrpupm)
        from "most_recent_postcode_user_pageviews_by_mon__dbt_tmp175823648372"
    );

    insert into "checkout"."published_data"."most_recent_postcode_user_pageviews_by_month" ("sk_mrpupm", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_mrpupm", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "most_recent_postcode_user_pageviews_by_mon__dbt_tmp175823648372"
    );
  