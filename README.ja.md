# favd
ディレクトリをブックマークして後で番号や部分一致でcdする為のスクリプト

## インストール
#### 1. ファイルをCloneかダウンロードしてどこかに配置
#### 2. sourceコマンドへのaliasを.bashrcに追加
```
alias favd="source /absolute/path/to/favd.sh"
```
NOTE: cdはsourceコマンドから実行されないと現在のシェルに反映されません
  
#### 3. Bash補完を使うには.bashrcでfavd-bash-completion.shをsource
```
source /absolute/path/to/favd-bash-completion.sh
```

## 使い方

### ディレクトリをfavリストに追加
カレントディレクトリを追加する場合
```
favd -a
```
ディレクトリを指定する場合
```
favd -a /home/yoshi/some/dir/
```
favdはディレクトリ情報管理の為に~/.favd_listを使います  
これを直接書き換えてもよいです  
（1行につき1ディレクトリパス）

### favリストの表示
```
favd -l
```

### 保存したディレクトリにcd
#### 番号指定
`favd -l`で出る番号を指定してcd
```
favd 1
```
#### 文字列指定
第1引数が文字列の場合、favリストの中から部分一致を探し1つだけ見つかった場合そこにcdします
```
favd partofdirname
```
#### Bash補完
favd-bash-completion.shをsourceしている場合、第1引数目でTABを押すと補完ができます

### 保存したディレクトリの削除
未実装(TODO)  
~/.favd_listから直接該当行を削除してください
