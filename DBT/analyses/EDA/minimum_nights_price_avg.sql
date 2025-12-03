WITH listings_hosts AS(
    SELECT
        *
    FROM
        AIRBNB_BERLIN.DEV.LISTINGS_HOSTS
)
SELECT
    MINIMUM_NIGHTS,
    AVG(PRICE) AS avg_price
FROM 
    listings_hosts
GROUP BY 
    MINIMUM_NIGHTS
ORDER BY 
    MINIMUM_NIGHTS
