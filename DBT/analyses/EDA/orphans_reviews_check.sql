WITH cleansed_reviews AS(
    SELECT
        *
    FROM 
        {{  ref('cleansed_reviews') }}
),
cleansed_listings AS(
    SELECT
        *
    FROM 
        {{  ref('cleansed_listings')   }}
)

SELECT 
    COUNT(*) AS ORPHANS_REVIEWS
FROM 
    cleansed_reviews AS R
LEFT JOIN
    cleansed_listings AS L
ON
    R.LISTING_ID = L.LISTING_ID
WHERE 
    L.LISTING_ID IS NULL
