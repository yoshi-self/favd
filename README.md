# favd
Bookmark directories and cd to them

## Installation
Put favd.sh somewhere  
Add alias of source command in your .bashrc like following  
(alias name is whatever you choose)
```
alias favd="source /absolute/path/to/favd.sh"
```
NOTE: cd doesn't work in current shell unless executed by source command

## Usage

### Add directory to fav list
Add current directory
```
favd -a
```
Add specified directory
```
favd -a /home/yoshi/some/dir/
```
favd creates ~/.favd_list to store directories

### List faved directories
```
favd -l
```

### cd to a directory
#### with number
cd to directory with number shown in `favd -l`
```
favd 1
```
#### with word
Tries to partial match with faved directories  
cd to the directory if only one directory matched
```
favd partofdirname
```

### Delete faved directory
Not implemented(TODO)  
Now please just manually remove the line from ~/.favd_list
