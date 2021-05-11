-- Users & Post Codes for all time aggregated by year
select
        md5(cast(concat(coalesce(cast(id as 
    varchar
), ''), '-', coalesce(cast(
    date_trunc('year', "timestamp")
 as 
    varchar
), ''), '-', coalesce(cast(postcode as 
    varchar
), ''), '-', coalesce(cast(url as 
    varchar
), '')) as 
    varchar
)) as sk_atpupy
      , us.id
      , date_trunc('year', pv."timestamp")     AS pageview_hour
      , us.postcode
      , pv.url
      , count(pv.user_id)                      AS total_pageviews
from "checkout"."raw_data"."pageviews" pv
join "checkout"."raw_data"."users_snapshot" us
on (pv.user_id = us.id and (pv."timestamp" between us.dbt_valid_from and us.dbt_valid_to or pv."timestamp" >= us.dbt_valid_from and us.dbt_valid_to is null))
group by us.id
      , date_trunc('year', pv."timestamp") 
      , us.postcode
      , pv.url