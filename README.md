# favd
Bookmark directories and cd to them

## Installation
#### 1. Clone or download and put files somewhere  
#### 2. Add alias of source command in your .bashrc like following  
```
alias favd="source /absolute/path/to/favd.sh"
```
NOTE: cd doesn't work in current shell unless executed by source command  
  
#### 3. For bash completion, also add source command in your .bashrc
```
source /absolute/path/to/favd-bash-completion.sh
```

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
#### With number
cd to directory with number shown in `favd -l`
```
favd 1
```
#### With word
Tries to partial match with faved directories  
cd to the directory if only one directory matched
```
favd partofdirname
```
### With Bash completion
If you sourced favd-bash-completion.sh, completion works on first argument

### Delete faved directory
Not implemented(TODO)  
Now please just manually remove the line from ~/.favd_list
