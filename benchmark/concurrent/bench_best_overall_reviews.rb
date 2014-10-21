require_relative '../benchmark_helper'

query = <<-EOF.strip
SELECT   title, reviewer_name, value
FROM     reviews
JOIN     review_ratings ON review_ratings.review_id = reviews.id
WHERE    review_ratings.rating_id = 548
AND      hotel_id = 38
ORDER BY value DESC
LIMIT 10
EOF

benchmark_concurrent_query(query)
