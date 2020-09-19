-- 集計関数
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