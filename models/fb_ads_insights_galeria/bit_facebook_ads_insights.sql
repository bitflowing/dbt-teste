{{ config(materialized='table') }}
SELECT
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.date_start")  AS metric_date,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.account_id")  AS account_id,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.account_name")  AS account_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.campaign_id")  AS campaign_id,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.campaign_name")  AS campaign_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.adset_id")  AS adset_id,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.adset_name")  AS adset_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.ad_id")  AS ad_id,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.ad_name")  AS ad_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.publisher_platform")  AS publisher_platform,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.platform_position")  AS platform_position,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.objective")  AS objective,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.account_currency")  AS account_currency,
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.spend") AS FLOAT64)  AS spend,
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.impressions") AS INT64)  AS impressions,
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.inline_link_clicks") AS INT64)  AS inline_link_clicks
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.unique_inline_link_clicks") AS INT64)  AS unique_inline_link_clicks,
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.unique_clicks") AS INT64)  AS unique_clicks
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.clicks") AS INT64)  AS clicks
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.frequency") AS INT64)  AS frequency
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.reach") AS INT64)  AS reach
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.inline_post_engagement")  AS inline_post_engagement
FROM 
    bitflowin-nonprod.galeria_airbyte._airbyte_raw_bit_4901315733251836_ads_insights 
WHERE DATE
    (_airbyte_emitted_at) = CURRENT_DATE()