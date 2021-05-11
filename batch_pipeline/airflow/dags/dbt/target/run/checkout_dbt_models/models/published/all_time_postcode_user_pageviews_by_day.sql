
      delete
    from "checkout"."published_data"."all_time_postcode_user_pageviews_by_day"
    where (sk_atpupd) in (
        select (sk_atpupd)
        from "all_time_postcode_user_pageviews_by_day__dbt_tmp175823828695"
    );

    insert into "checkout"."published_data"."all_time_postcode_user_pageviews_by_day" ("sk_atpupd", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_atpupd", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "all_time_postcode_user_pageviews_by_day__dbt_tmp175823828695"
    );
  