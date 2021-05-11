
      delete
    from "checkout"."published_data"."most_recent_postcode_user_pageviews_by_day"
    where (sk_mrpupd) in (
        select (sk_mrpupd)
        from "most_recent_postcode_user_pageviews_by_day__dbt_tmp175823665931"
    );

    insert into "checkout"."published_data"."most_recent_postcode_user_pageviews_by_day" ("sk_mrpupd", "id", "pageview_hour", "postcode", "url", "total_pageviews")
    (
       select "sk_mrpupd", "id", "pageview_hour", "postcode", "url", "total_pageviews"
       from "most_recent_postcode_user_pageviews_by_day__dbt_tmp175823665931"
    );
  