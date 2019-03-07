# MeCabユーザ辞書 for Abyss.fun

## なにこれ

マストドンのメイドインアビスサーバー「Abyss.fun」で使われているMeCabのユーザ辞書です。  
ハッシュタグ自動挿入機能はMeCabを利用した形態素解析をすることで、メイドインアビスにちなんだキーワードを検出しています。詳しくは [Abyss.fun Wikiの解説ページ](https://wiki.abyss.fun/abyss-fun/ktl) を御覧ください。

## ユーザ辞書の使い方

ご自分のMeCab動作環境に組み込みたい方（いるのか？いないだろ！？）はdicファイルにコンパイルしてご利用ください。以下コンパイル手順

### 1. MeCabをインストール

文字コード云々などもあるため、出来ればソースコードからビルドすることをお勧めします。

```shell
# MeCab本体のインストール
git clone https://github.com/taku910/mecab.git
cd mecab/mecab
./configure --with-charset=utf8 --enable-utf8-only
make
sudo make install

#aptから必要なパッケージを入れる。yumは知らない。
sudo apt install libmecab-dev libmecab2

# システム辞書(ipadic)のインストール
cd ../mecab-ipadic
./configure --with-charset=utf8
make
sudo make install
```

### 2. ユーザ辞書のコンパイル

```shell
git clone https://github.com/taku910/mecab-userdic-abyss.git
cd mecab-userdic-abyss
/usr/local/libexec/mecab/mecab-dict-index -d/usr/local/lib/mecab/dic/ipadic -f utf-8 -t utf-8 -u user.dic user.csv
```

### MeCabの設定ファイルにユーザ辞書を追加

```
sudo echo userdic = /YOUR_USERDIC_DIRECTORY/user.dic >> /usr/local/etc/mecabrc
```

あとは `mecab` コマンドを打って正しく動くか確認してみましょう。

### 注意事項

とりあえず需要はないと思うので、汎用的には作ってません。  
なので不足してる単語とかも結構あると思います。

もし必要な方がいましたら、そのままforkするなりして使っていただくか、Issueの方に何かしら意見を書き込んでください。単語の追加など、対応しようと思います。

お問い合わせは [guskma@abyss.fun](https://abyss.fun/@guskma) まで
