#!/usr/bin/env bash

# コーディングルールをチェック
CS_CHECK=$(phpcs -q index.php --standard=../../phpcs.xml)
if [ "$CS_CHECK" = "" ]; then
  echo "コーディングルール: OK"
else
  echo "コーディングルール: NO"
fi

# テストパターン1から5の出力をチェック
for i in 1 2 3 4 5
do
  echo ./input/input${i} | php index.php > ./output

  # diffで差分がなければOKを表示
  RESULT=$(diff -q ./expected/expected${i} ./output);
  if [ "$RESULT" = "" ]; then
      echo "テストパターン1: OK！"
  else
      echo "テストパターン1: NO！"
  fi
done
rm ./output