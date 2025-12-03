WITH listings_hosts AS(
    SELECT
        *
    FROM
        AIRBNB_BERLIN.DEV.LISTINGS_HOSTS
)
SELECT
    IS_SUPERHOST,
    AVG(PRICE) AS avg_price
FROM 
    listings_hosts
GROUP BY 
    IS_SUPERHOST
ORDER BY 
    IS_SUPERHOST

    