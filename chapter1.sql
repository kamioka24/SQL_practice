-- データベースの作成
CREATE DATABASE shop;


-- productテーブルの作成
CREATE TABLE product (
  product_id     CHAR(4)      NOT NULL,
  name           VARCHAR(20)  NOT NULL,
  genre          VARCHAR(10)  NOT NULL,
  price          INTEGER      NOT NULL,
  cost           INTEGER      NOT NULL,
  day            DATE,
  PRIMARY KEY (product_id)
);