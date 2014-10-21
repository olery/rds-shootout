require_relative 'benchmark_helper'

query = <<-EOF.strip
SELECT   COUNT(id) AS amount, type
FROM     review_comments
WHERE    type IS NOT NULL
AND      type != ''
GROUP BY type
ORDER BY amount DESC
EOF

benchmark_query(query)
