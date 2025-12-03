WITH cleansed_listings AS(
    SELECT
        * 
    FROM 
        {{ ref('cleansed_listings') }}
),
cleansed_hosts AS(
    SELECT
        *
    FROM
        {{ ref('cleansed_hosts') }}
)
SELECT 
    COUNT(L.HOST_ID) AS total_hosts,
    COUNT(DISTINCT L.HOST_ID) AS distinct_hosts,
    COUNT(L.HOST_ID) - COUNT(DISTINCT L.HOST_ID) AS duplicate_hosts
FROM 
    cleansed_listings AS L
LEFT JOIN 
    cleansed_hosts AS H
ON L.HOST_ID = H.HOST_ID
