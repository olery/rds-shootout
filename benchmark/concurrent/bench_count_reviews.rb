require_relative '../benchmark_helper'

query = 'SELECT COUNT(id) FROM reviews'

benchmark_concurrent_query(query)
