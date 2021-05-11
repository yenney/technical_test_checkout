-- most recent users & Post Codes aggregated to nearest hour
select
	  md5(cast(concat(coalesce(cast(id as 
    varchar
), ''), '-', coalesce(cast(
    date_trunc('hour', "timestamp")
 as 
    varchar
), ''), '-', coalesce(cast(postcode as 
    varchar
), ''), '-', coalesce(cast(url as 
    varchar
), '')) as 
    varchar
)) as sk_mrpuph
      , us.id
      , date_trunc('hour', pv."timestamp")     AS pageview_hour
      , us.postcode
      , pv.url
      , count(pv.user_id)                      AS total_pageviews
from "checkout"."raw_data"."pageviews" pv
join "checkout"."raw_data"."users_snapshot" us
on (pv.user_id = us.id and us.dbt_valid_to is null)
group by us.id
      , date_trunc('hour', pv."timestamp") 
      , us.postcode
      , pv.url