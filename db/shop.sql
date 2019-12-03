DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS tag_links;

CREATE TABLE authors(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE books(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  author_id INT REFERENCES authors (id) ON DELETE CASCADE,
  genre VARCHAR,
  description VARCHAR,
  stock INT,
  buying_cost INT,
  selling_price INT,
  picture_link VARCHAR
);

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  tag VARCHAR
);

CREATE TABLE tag_links(
  id SERIAL PRIMARY KEY,
  book_id INT REFERENCES books(id),
  tag_id INT REFERENCES tag(id)
);
