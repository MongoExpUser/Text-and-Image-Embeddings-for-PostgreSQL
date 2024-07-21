-- image table
CREATE TABLE IF NOT EXISTS public.images (
  id INTEGER PRIMARY KEY NOT NULL GENERATED ALWAYS  AS IDENTITY,
  image_filename VARCHAR(20) NOT NULL,
  image_label VARCHAR(20) NOT NULL,
  image_embedding VECTOR(128) NOT NULL
);

CREATE INDEX IF NOT EXISTS image_embedding_idx ON  public.images USING hnsw (embedding vector_cosine_ops);


-- chat table
CREATE TABLE IF NOT EXISTS public.chat (
  id INTEGER PRIMARY KEY NOT NULL GENERATED ALWAYS  AS IDENTITY,
  createdon TIMESTAMP NOT NULL, 
  chat_embedding VECTOR(32) NOT NULL
);

CREATE INDEX IF NOT EXISTS chat_embedding_idx ON  public.chat USING  hnsw (embedding vector_cosine_ops);
