DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS shops;

CREATE TABLE shops(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  address VARCHAR,
  register_cash INT
);

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
