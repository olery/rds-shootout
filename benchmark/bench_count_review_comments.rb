require_relative 'benchmark_helper'

query = 'SELECT COUNT(id) FROM review_comments'

benchmark_query(query)
