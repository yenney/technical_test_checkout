-- Users & Post Codes for all time aggregated to nearest hour
select
	  {{ dbt_utils.surrogate_key(['id', dbt_utils.date_trunc('hour', '"timestamp"'), 'postcode', 'url']) }} as sk_atpuph
      , us.id
      , date_trunc('hour', pv."timestamp")     AS pageview_hour
      , us.postcode
      , pv.url
      , count(pv.user_id)                      AS total_pageviews
from {{ ref('pageviews') }} pv
join {{ ref('users_snapshot') }} us
on (pv.user_id = us.id and (pv."timestamp" between us.dbt_valid_from and us.dbt_valid_to or pv."timestamp" >= us.dbt_valid_from and us.dbt_valid_to is null))
group by us.id
      , date_trunc('hour', pv."timestamp") 
      , us.postcode
      , pv.url