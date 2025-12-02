WITH src_reviews AS (
    SELECT
        *
    FROM 
        {{  ref('src_reviews')  }}
)
SELECT
    *
FROM
    src_reviews
WHERE
    REVIEW_TEXT IS NOT NULL AND 
    REVIEW_SENTIMENT IS NOT NULL
