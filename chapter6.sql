-- 集計関数
-- SELECT文、HAVING句の中でしか利用できない。

/*
上4つは集計
・SUM     合計
・MAX     最大値
・MIN     最小値
・AVG     平均値
・COUNT   カウント(計数)
*/

SELECT
  SUM(出金額) AS 合計出金額,
  AVG(出金額) AS 平均出金額,
  MAX(出金額) AS 最も大きな散財,
  MIN(出金額) AS 最も少額な支払い
 FROM 家計簿;

-- 食費の行数を数える
SELECT COUNT(*) AS 食費の行数
  FROM 家計簿
 WHERE 費目 = '食費'
/*
・COUNT(*)とCOUNT(列)の違い
  (*)は単純な行数のカウント。NULLも含める。
  (列)は指定列の値がNULLである行を無視してカウントする。
*/

SELECT COUNT(DISTINCT 費目) FROM 家計簿
-- DISTINCTで重複を除く。この例では費目の種類数がカウントされることになる。

SELECT 日付, SUM(出金額) AS 出金額計 FROM 家計簿
/*
このようなSQL文だと、結果が凸凹になってしまう。
=> 日付が複数行で出金額計は1行。
SQLでは結果表が長方形、つまり列ごとの行数が一致しなくてはならない。
*/

-- 集計関数はNULLを無視するので、NULLを0にして集計したい場合はCOALESCEを使う。(5章で学習済み)
SELECT AVG(COALESCE(出金額, 0)) AS 出金額の平均
  FROM 家計簿;


-- データをグループに分ける
SELECT 費目, SUM(出金額) AS 費目別の出金合計額
  FROM 家計簿
 GROUP BY 費目;
-- 費目ごとに出金額の合計を抽出する。

SELECT 費目, SUM(出金額) AS 費目別の出金合計額
  FROM 家計簿
 GROUP BY 費目;
HAVING SUM(出金額) > 0
-- 集計結果に対する絞り込みをする場合はHAVINGを使う。
/*
SELECT     グループ化の基準列名・・・, 集計関数
  FROM     テーブル名
(WHERE     もとの表に対する絞り込み条件)
 GROUP BY  グループ化の基準列名
HAVING     集計結果に対する絞り込み条件
*/