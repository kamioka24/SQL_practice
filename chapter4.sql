-- 検索結果の加工


-- DISTINCT(重複行を除外する)
SELECT DISTINCT 費目
  FROM 家計簿
-- 費目の種類を検出できる。
-- 他の修飾と異なり、SELECT文の最初に記述する必要がある。


-- ORDER BY(結果を並び替える)
-- 昇順
SELECT *
  FROM 家計簿
 ORDER BY 出金額 ASC -- ASCは省略できる。何も書かなければ昇順。

-- 降順
SELECT *
  FROM 家計簿
 ORDER BY 出金額 DESC

-- 複数の条件を指定することも可能。
SELECT *
  FROM 家計簿
 ORDER BY 入金額 DESC, 出金額 ASC
-- ASC、DESCの条件をそれぞれに指定することが可能。
-- 入金額を降順に並び替え、入金額が同じ値のものは出金額の昇順を条件に並び替える。

-- 列名でなく、列番号で指定することも可能。
SELECT 入金額, 出金額
  FROM 家計簿
 ORDER BY 1 DESC, 2 DESC


-- LIMIT(先頭から数件の検出)TOPを使う場合も
SELECT 費目, 出金額
  FROM 家計簿
 ORDER BY 出金額 DESC LIMIT 3
-- 出金額の多い順に3つ検出する。

SELECT 費目, 出金額
  FROM 家計簿
 ORDER BY 出金額 DESC LIMIT 1 OFFSET 2
-- 出金額が3番目に高い費目と出金額を検出する。


-- 集合演算子
-- 列数やデータ型が同じでないと使えない。
-- 列数が一致しないテーブルを繋げたい場合はNULLを追加して数を一致させる。
/*
・UNION → 和集合
　(2つの検索結果を足し合わせたもの)
・EXCEPT(MINUS) → 差集合
　(最初の検索結果から次の検索結果と重複する部分を取り除いたもの)
・INTERSECT → 積集合
　(2つの検索結果で重複するもの)
*/

-- UNION (和集合)
SELECT 費目, 入金額, 出金額
  FROM 家計簿
 UNION
SELECT 費目, 入金額, 出金額
  FROM 家計簿アーカイブ
 ORDER BY 2, 3, 1
-- 家計簿と家計簿アーカイブテーブルの費目、入金額、出金額を入金額、出金額、費目の優先順で昇順検出する。
-- UNIONの後ろにALLを付けると、重複行を1行にまとめず、そのまま別の行として返す。

/* 集合演算子でORDER BYを使うときの注意点
・ORDER BYは最後のSELECT文に記述する。
・列番号以外による指定(列名やASによる別名)の場合、1つ目のSELECT文のものを指定する。
*/

-- EXCEPT / MINUS (差集合)
-- SELECT文の順番に注意。順番によって検出結果が変わる。
-- ALLの使い方はUNIONと同じ。
SELECT 費目
  FROM 家計簿
 EXCEPT
SELECT 費目
  FROM 家計簿アーカイブ
-- 家計簿にはあって、家計簿アーカイブにはない費目の検出。

-- INTERSECT (積集合)
SELECT 費目
  FROM 家計簿
 INTERSECT
SELECT 費目
  FROM 家計簿アーカイブ
-- 両方のテーブルにある費目を検出。