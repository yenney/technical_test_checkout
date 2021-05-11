-- Users & Post Codes for all time granular level
select
		{{ dbt_utils.surrogate_key(['id', "timestamp", 'postcode', 'url']) }} as sk_atpup
      , us.id
      , pv."timestamp"     AS pageview_dt
      , us.postcode
      , pv.url
      , count(pv.user_id)  AS total_pageviews
from {{ ref('pageviews') }} pv
join {{ ref('users_snapshot') }} us
on (pv.user_id = us.id and (pv."timestamp" between us.dbt_valid_from and us.dbt_valid_to or pv."timestamp" >= us.dbt_valid_from and us.dbt_valid_to is null))
group by us.id
      , pv."timestamp"
      , us.postcode
      , pv.url