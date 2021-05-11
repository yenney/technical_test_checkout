-- most recent users & Post Codes aggregated by year
select
        {{ dbt_utils.surrogate_key(['id', dbt_utils.date_trunc('year', '"timestamp"'), 'postcode', 'url']) }} as sk_mrpupy
      , us.id
      , date_trunc('year', pv."timestamp")     AS pageview_hour
      , us.postcode
      , pv.url
      , count(pv.user_id)                      AS total_pageviews
from {{ ref('pageviews') }} pv
join {{ ref('users_snapshot') }} us
on (pv.user_id = us.id and us.dbt_valid_to is null)
group by us.id
      , date_trunc('year', pv."timestamp") 
      , us.postcode
      , pv.url