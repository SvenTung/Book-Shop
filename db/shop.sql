DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

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

CREATE TABLE links(
  id SERIAL PRIMARY KEY,
  book_id INT REFERENCES books(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE
);
