WITH cleansed_listings AS(
    SELECT
        *
    FROM 
        AIRBNB_BERLIN.DEV.CLEANSED_LISTINGS
)
SELECT (
    SELECT
        COUNT
        (DISTINCT MINIMUM_NIGHTS)
    FROM 
        cleansed_listings
    ORDER BY
        MINIMUM_NIGHTS
) AS DISTINCT_MINIMUM_NIGHTS_VALUE,
(
    SELECT
        COUNT
        (DISTINCT ROOM_TYPE)
    FROM 
        cleansed_listings
    ORDER BY
        ROOM_TYPE
) AS DISTINCT_ROOM_TYPE_VALUE

