require_relative 'benchmark_helper'

query = 'SELECT COUNT(id) FROM review_ratings'

benchmark_query(query)
