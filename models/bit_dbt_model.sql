{{ config(materialized='table') }}
SELECT
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.date_start")  AS metric_date,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.account_name")  AS account_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.campaign_name")  AS campaign_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.adset_name")  AS adset_name,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.ad_name")  AS ad_name,
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.spend") AS FLOAT64)  AS spend,
    CAST(JSON_EXTRACT_SCALAR(_airbyte_data, "$.impressions") AS INT64)  AS impressions,
    JSON_EXTRACT_SCALAR(_airbyte_data, "$.inline_link_clicks")  AS inline_link_clicks

FROM 
    bitflowin-nonprod.galeria_airbyte._airbyte_raw_bit_4901315733251836_ads_insights 
WHERE DATE
    (_airbyte_emitted_at) = "2022-02-17"