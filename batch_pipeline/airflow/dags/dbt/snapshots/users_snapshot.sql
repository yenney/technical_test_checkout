{% snapshot users_snapshot %}
	select * from {{ source('stage_data', 'users_extract') }}
{% endsnapshot %}