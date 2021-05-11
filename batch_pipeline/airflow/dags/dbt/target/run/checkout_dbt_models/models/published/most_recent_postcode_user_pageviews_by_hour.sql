
      delete
    from "checkout"."published_data"."most_recent_postcode_user_pageviews_by_hour"
    where (sk_mrpuph) in (
        select (sk_mrpuph)
        from "most_recent_postcode_user_pageviews_by_hou__dbt_tmp175823706105"
    );

    insert into "checkout"."published_data"."most_recent_postcode_user_pageviews_by_hour" ("sk_mrpuph", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_mrpuph", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "most_recent_postcode_user_pageviews_by_hou__dbt_tmp175823706105"
    );
  