-- schema
CREATE SCHEMA IF NOT EXISTS vsearch AUTHORIZATION postgres;

-- image table
DROP TABLE IF EXISTS vsearch.images CASCADE;
CREATE TABLE IF NOT EXISTS vsearch.images (
  id INTEGER PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  image_filename VARCHAR(15) NOT NULL,
  image_label VARCHAR(10) NOT NULL,
  image_embedding VECTOR(128) NOT NULL
);
CREATE INDEX IF NOT EXISTS image_embedding_idx ON vsearch.images USING hnsw (image_embedding vector_cosine_ops);

-- text table
DROP TABLE IF EXISTS vsearch.text CASCADE;
CREATE TABLE IF NOT EXISTS vsearch.text (
  id INTEGER PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  createdon TIMESTAMP NOT NULL, 
  text_embedding VECTOR(32) NOT NULL
);
CREATE INDEX IF NOT EXISTS text_embedding_idx ON vsearch.text USING hnsw (text_embedding vector_cosine_ops);
