# SML/NJ Docker Image

岡山大学の講義 非手続き型言語で用いるSML環境のためのDocker Imageです．

## Usage

SML/NJインタプリタを起動する場合

```sh
docker run -it --rm aaarsalmon/smlnj
```

SML/NJインタプリタを起動し，
カレントディレクトリ以下のファイル `./some/functions.sml` をロードする場合

```sh
docker run -it --rm -v $(pwd):/root aaarsalmon/smlnj some/functions.sml
```
