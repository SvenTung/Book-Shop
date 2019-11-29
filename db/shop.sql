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
  description VARCHAR,
  stock INT,
  buying_cost INT,
  selling_price INT,
  pic_link VARCHAR
);
