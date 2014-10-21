require_relative 'benchmark_helper'

query = <<-EOF.strip
SELECT COUNT(id) as amount, reviewer_gender
FROM   reviews
WHERE  reviewer_gender IS NOT NULL
AND    reviewer_gender != ''
GROUP  BY reviewer_gender
ORDER  BY amount DESC
EOF

benchmark_query(query)
