#!/bin/bash

REPO_DIR=/YOUR/REPOSITORY/DIRECTORY/mecab-userdic-miabyss
IPADIC_DIR=/usr/local/lib/mecab/dic/ipadic
MECAB_DICT_INDEX=/usr/local/libexec/mecab/mecab-dict-index

cd $REPO_DIR

git pull origin master || exit $?

$MECAB_DICT_INDEX -d $IPADIC_DIR -f utf-8 -t utf-8 -u user.dic user.csv || exit $?
