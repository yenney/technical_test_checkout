
      delete
    from "checkout"."published_data"."all_time_postcode_user_pageviews_by_year"
    where (sk_atpupy) in (
        select (sk_atpupy)
        from "all_time_postcode_user_pageviews_by_year__dbt_tmp175824474427"
    );

    insert into "checkout"."published_data"."all_time_postcode_user_pageviews_by_year" ("sk_atpupy", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_atpupy", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "all_time_postcode_user_pageviews_by_year__dbt_tmp175824474427"
    );
  