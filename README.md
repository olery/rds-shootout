# RDS Benchmarks

A set of fairly basic benchmarks (using benchmark-ips) to compare MySQL and
PostgreSQL when running on Amazon RDS.

The following tables exist in the test databases:

* reviews
* review_comments
* review_ratings

PostgreSQL had the following amount of rows:

* reviews: 3959551 rows
* review_comments: 5002704 rows
* review_ratings: 14305626 rows

MySQL in turn had the following:

* reviews: 3959556 rows
* review_comments: 5002710 rows
* review_ratings: 14305657 rows

## Requirements

* Ruby 2.1 or newer
* Bundler
* MySQL development headers (for the `mysql2` gem)
* PostgreSQL development headers (for the `pg` gem)

## Installation

Install the required Gems:

    bundle install

Configure PostgreSQL:

    export PG_HOST='...'
    export PG_DB='...'
    export PG_USER='...'
    export PG_PASSWORD='...'

Then configure MySQL:

    export MYSQL_HOST='...'
    export MYSQL_DB='...'
    export MYSQL_USER='...'
    export MYSQL_PASSWORD='...'

You can now run a benchmark:

    ruby benchmark/bench_count_reviews.rb

## Reading Material

* <https://wiki.postgresql.org/wiki/Slow_Counting>
