-- most recent users & Post Codes by granular level
select
		{{ dbt_utils.surrogate_key(['id', "timestamp", 'postcode', 'url']) }} as sk_mrpup
      , us.id
      , pv."timestamp"     AS pageview_dt
      , us.postcode
      , pv.url
      , count(pv.user_id)  AS total_pageviews
from {{ ref('pageviews') }} pv
join {{ ref('users_snapshot') }} us
on (pv.user_id = us.id and us.dbt_valid_to is null)
group by us.id
      , pv."timestamp"
      , us.postcode
      , pv.url