
      delete
    from "checkout"."published_data"."most_recent_postcode_user_pageviews"
    where (sk_mrpup) in (
        select (sk_mrpup)
        from "most_recent_postcode_user_pageviews__dbt_tmp175823691626"
    );

    insert into "checkout"."published_data"."most_recent_postcode_user_pageviews" ("sk_mrpup", "id", "pageview_dt", "postcode", "url", "total_pageviews")
    (
       select "sk_mrpup", "id", "pageview_dt", "postcode", "url", "total_pageviews"
       from "most_recent_postcode_user_pageviews__dbt_tmp175823691626"
    );
  