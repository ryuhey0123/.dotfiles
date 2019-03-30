#!/bin/sh

# 構造計算書用ページ振り
# 第一引数から第二引数までのページを振る
# 例) addpages 0 7 -> 0*.pdf から 7*.pdf までのページが振られる

addpages() {
    for i in `seq $1 $2`
    do
        addpage -f "${i} - %d" -z 8 -o $i.pdf $i*.pdf
    done
}

