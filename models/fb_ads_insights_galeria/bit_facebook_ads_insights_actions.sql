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
    JSON_EXTRACT_SCALAR(actions, "$.action_type") AS action_type,
    JSON_EXTRACT_SCALAR(actions, "$.value") AS value
FROM 
    bitflowin-nonprod.galeria_airbyte._airbyte_raw_bit_4901315733251836_ads_insights
LEFT JOIN
    UNNEST(JSON_EXTRACT_ARRAY(_airbyte_data, "$.unique_actions")) AS actions