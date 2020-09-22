-- データベースの作成
CREATE DATABASE shop;


-- productテーブルの作成
-- CHARは固定文字列。足りない文字数を空白で埋める。桁数が決まっているものに向いている。
-- VARCHARは可変長文字列。文字数が足りなくても空白は追加されず文字数分だけの領域を確保。名前などの桁数が変動するものに向く。
CREATE TABLE product (
  product_id     CHAR(4)      NOT NULL,
  name           VARCHAR(20)  NOT NULL,
  genre          VARCHAR(10)  NOT NULL,
  price          INTEGER      NOT NULL,
  cost           INTEGER      NOT NULL,
  day            DATE,
  PRIMARY KEY (product_id) -- 主キーの設定
);


-- 別名の定義(出力)
-- 元々の名前 AS 任意の名前 で別名を定義することができる
SELECT 費目 AS ITEM, 入金額 AS RECEIVE, 出金額 AS PAY
  FROM 家計簿 AS MONEYBOOK
 WHERE 費目 = '給料' -- 費目が給料の行を取得。

INSERT INTO 家計簿
            (費目, 日付, 出金額) -- 上の行の後ろに続けて1行で書いてもいい。
     VALUES ('通信費', '2020-04-15', 6000); -- 2行目の順番に対応して記述。テーブル通りの順番でなくても可。
-- この場合、3項目のみデータが追加される。
-- 全ての項目を追加する場合は2行目を書かずに、VALUESで全てを記述。この場合はテーブルの順番にする必要がある。

/*
複数行コメント
あああ
いいい
ううう
えええ
おおお
*/