-- 副問い合わせ
-- 1つのSQL文で2つ以上の処理をさせることができる。
/*
ひとまずSELECT文で何らかの検索結果を得て、
得られた値を用いてSELECTやUPDATEなどを実行することがよくある。
*/

SELECT MAX(出金額) FROM 家計簿 -- (1)
-- (1)で得た金額を条件式に記述して費目と金額を取得する。
SELECT 費目, 出金額 FROM 家計簿
 WHERE 出金額 = --【(1)で得た金額】
-- => 最も大きな出費の費目と金額が抽出される。

-- SELECT文をネストする
SELECT 費目, 出金額 FROM 家計簿
 WHERE 出金額 = (SELECT MAX(出金額) FROM 家計簿)
-- (1)を()で囲んで1つの文にまとめることができる。


-- 単一行副問い合わせ(検索結果が1行1列となるもの)
UPDATE 家計簿集計
  SET 平均 = (SELECT AVG(出金額)
               FROM 家計簿アーカイブ
              WHERE 出金額 > 0
               AND 費目 = '食費')
 WHERE 費目 = '食費'
-- SET句が一つの値に化ける。
-- SELECT文の選択列リストやFROM句、UPDATEのSET句、WHERE句の条件式などに記述できる。

-- SELECT文の選択列リストでの利用例
SELECT 日付, メモ, 出金額,
       (SELECT 合計 FROM 家計簿集計
        　WHERE 費目 = '食費') AS 過去の合計額
  FROM 家計簿アーカイブ
 WHERE 費目 = '食費'


-- 複数行副問い合わせ(検索結果がn行1列となるもの)
-- IN, ANY, ALL演算子を用いた条件式が代表的な例。
-- WHERE句の条件式やSELECT文のFROM句に記述することができる。
SELECT * FROM 家計簿集計
 WHERE 費目 IN ('食費', '水道光熱費', '教育娯楽費', '給料');
-- この文を副問い合わせに置き換えると次のようになる。
SELECT * FROM 家計簿集計
 WHERE 費目 IN (SELECT DISTINCT 費目 FROM 家計簿);
-- この2つの文の結果は全く同じになる。

-- ANYでの利用
SELECT * FROM 家計簿
 WHERE 費目 = '食費'
   AND 出金額 < ANY (SELECT 出金額 FROM 家計簿アーカイブ
    　　　　　　　　　　WHERE 費目 = '食費');
/*
副問い合わせの結果で得られる複数の値のいずれかより小さければ...
もしALLなら得られる値のどれよりも小さければ...というようになる。
*/

