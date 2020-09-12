-- WHERE 句の基本
/*
・WHEREを使用しないと全ての行が対象となる。
・SELECT, UPDATE, DELETE分で使用可能。
・WHEREの後ろには条件式を記述。
  (結果が必ずtrueかfalseになる条件式)
  比較演算子(=, <, >, <=, >=, <>)
・空白はNULL
  IS NULL => NULLであることを判定する。
  IS NOT NULL => NULLでないことを判定する。
*/


-- 家計簿テーブルの出金額が0以上の行を全て削除する。
DELETE FROM 家計簿
 WHERE 出金額 > 0


-- 出金額がNULLの行を全て検出する。
SELECT *
  FROM 家計簿
 WHERE 出金額 IS NULL


-- LIKE演算子
-- メモ列に1月が含まれている行を検出する。
SELECT *
  FROM 家計簿
 WHERE メモ LIKE '%1月%'
-- %の位置で含み方の条件を変えることができる。


-- ESCAPE
-- 100%を含む行を検出したい場合
SELECT *
  FROM 家計簿
 WHERE メモ LIKE '%100$%' ESCAPE '$'
-- $に続く%はただの文字として扱われる。


-- BETWEEN演算子
-- 〜以上、〜以下の範囲を条件とする場合に使用する。
-- 出金額が100以上、3000以下の行を検出する。
SELECT *
  FROM 家計簿
 WHERE 出金額 BETWEEN 100 AND 3000


-- IN / NOT IN演算子
-- 費目が食費または交際費の行を検出する。
SELECT *
  FROM 家計簿
 WHERE 費目 IN ('食費', '交際費')

-- 費目が食費または交際費以外の行を検出する。
SELECT *
  FROM 家計簿
 WHERE 費目 NOT IN ('食費', '交際費')


-- 論理演算子(AND / OR)
/*
WHERE 条件式 AND(OR) 条件式
という形で使う。
WHERE NOT 条件式
という形で条件式でないものを指定することも可能。
優先順位はNOT, AND, ORの順
()で囲めば優先順位を引き上げられる。
*/

