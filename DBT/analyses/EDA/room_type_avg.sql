WITH listings_hosts AS(
    SELECT
        *
    FROM
        AIRBNB_BERLIN.DEV.LISTINGS_HOSTS
)
SELECT
    ROOM_TYPE,
    AVG(PRICE) AS avg_price
FROM 
    listings_hosts
GROUP BY 
    ROOM_TYPE
ORDER BY 
    ROOM_TYPE
