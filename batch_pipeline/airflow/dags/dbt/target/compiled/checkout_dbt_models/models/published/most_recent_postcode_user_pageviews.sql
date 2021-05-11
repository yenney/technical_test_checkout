-- most recent users & Post Codes by granular level
select
		md5(cast(concat(coalesce(cast(id as 
    varchar
), ''), '-', coalesce(cast(timestamp as 
    varchar
), ''), '-', coalesce(cast(postcode as 
    varchar
), ''), '-', coalesce(cast(url as 
    varchar
), '')) as 
    varchar
)) as sk_mrpup
      , us.id
      , pv."timestamp"     AS pageview_dt
      , us.postcode
      , pv.url
      , count(pv.user_id)  AS total_pageviews
from "checkout"."raw_data"."pageviews" pv
join "checkout"."raw_data"."users_snapshot" us
on (pv.user_id = us.id and us.dbt_valid_to is null)
group by us.id
      , pv."timestamp"
      , us.postcode
      , pv.url