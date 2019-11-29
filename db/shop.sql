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
  buying_cost FLOAT,
  selling_price FLOAT,
  pic_link VARCHAR
);
