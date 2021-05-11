
      delete
    from "checkout"."published_data"."all_time_postcode_user_pageviews"
    where (sk_atpup) in (
        select (sk_atpup)
        from "all_time_postcode_user_pageviews__dbt_tmp175823875276"
    );

    insert into "checkout"."published_data"."all_time_postcode_user_pageviews" ("sk_atpup", "id", "pageview_dt", "postcode", "url", "total_pageviews")
    (
       select "sk_atpup", "id", "pageview_dt", "postcode", "url", "total_pageviews"
       from "all_time_postcode_user_pageviews__dbt_tmp175823875276"
    );
  