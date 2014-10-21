-- PostgreSQL database dump

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE TABLE review_comments (
    id integer NOT NULL,
    review_id integer,
    type text,
    comment text
);

CREATE SEQUENCE review_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE review_comments_id_seq OWNED BY review_comments.id;

CREATE TABLE review_ratings (
    id integer NOT NULL,
    review_id integer,
    rating_id integer,
    value integer
);

CREATE SEQUENCE review_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE review_ratings_id_seq OWNED BY review_ratings.id;

CREATE TABLE reviews (
    id integer NOT NULL,
    title text,
    hotel_id integer NOT NULL,
    connection_id integer NOT NULL,
    review_id text NOT NULL,
    review_date date,
    reviewer_name text,
    reviewer_location text,
    reviewer_contributions integer,
    reviewer_travel_style text,
    reviewer_age text,
    reviewer_gender text,
    sentiment text,
    language text,
    created_at timestamp without time zone
);

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY review_comments ALTER COLUMN id SET DEFAULT nextval('review_comments_id_seq'::regclass);

ALTER TABLE ONLY review_ratings ALTER COLUMN id SET DEFAULT nextval('review_ratings_id_seq'::regclass);

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);

ALTER TABLE ONLY review_comments ADD CONSTRAINT review_comments_pkey PRIMARY KEY (id);

ALTER TABLE ONLY review_ratings ADD CONSTRAINT review_ratings_pkey PRIMARY KEY (id);

ALTER TABLE ONLY reviews ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);

CREATE INDEX review_ratings_rating_id_index ON review_ratings USING btree (rating_id);

CREATE INDEX review_ratings_review_id_index ON review_ratings USING btree (review_id);

CREATE INDEX reviews_connection_id_index ON reviews USING btree (connection_id);

CREATE INDEX reviews_hotel_id_index ON reviews USING btree (hotel_id);

CREATE INDEX reviews_review_date_index ON reviews USING btree (review_date);

CREATE UNIQUE INDEX reviews_review_id_index ON reviews USING btree (review_id);
