
      delete
    from "checkout"."published_data"."most_recent_postcode_user_pageviews_by_year"
    where (sk_mrpupy) in (
        select (sk_mrpupy)
        from "most_recent_postcode_user_pageviews_by_yea__dbt_tmp175824220563"
    );

    insert into "checkout"."published_data"."most_recent_postcode_user_pageviews_by_year" ("sk_mrpupy", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_mrpupy", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "most_recent_postcode_user_pageviews_by_yea__dbt_tmp175824220563"
    );
  