require 'benchmark/ips'
require 'pg'
require 'mysql2'
require 'connection_pool'

def connect_pg
  return PG.connect(
    :host     => ENV['PG_HOST'],
    :dbname   => ENV['PG_DB'],
    :user     => ENV['PG_USER'],
    :password => ENV['PG_PASSWORD']
  )
end

def connect_mysql
  return Mysql2::Client.new(
    :host     => ENV['MYSQL_HOST'],
    :database => ENV['MYSQL_DB'],
    :username => ENV['MYSQL_USER'],
    :password => ENV['MYSQL_PASSWORD']
  )
end

def benchmark_query(query)
  Benchmark.ips do |bench|
    bench.report 'MySQL' do
      MYSQL_CONNECTION.query(query).count
    end

    bench.report 'PostgreSQL' do
      PG_CONNECTION.exec(query).count
    end

    bench.compare!
  end
end

def benchmark_concurrent_query(query)
  Benchmark.ips do |bench|
    bench.report 'MySQL 5 threads' do
      concurrent do
        MYSQL_POOL.with { |connection| connection.query(query).count }
      end
    end

    bench.report 'PostgreSQL 5 threads' do
      concurrent do
        PG_POOL.with { |connection| connection.exec(query).count }
      end
    end

    bench.compare!
  end
end

def concurrent(amount = 5)
  amount.times.map { Thread.new { yield } }.each(&:join)
end

# fukit, globals here we go
PG_CONNECTION    = connect_pg
MYSQL_CONNECTION = connect_mysql

PG_POOL    = ConnectionPool.new(:size => 5) { connect_pg }
MYSQL_POOL = ConnectionPool.new(:size => 5) { connect_mysql }
