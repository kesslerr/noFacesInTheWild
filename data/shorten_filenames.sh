#/bin/bash
#Shorten long file names in folder (c) Denis Trofimov hhttps://github.com/derofim

maxLen="100" # Used to find files with desired length to rename
find . -maxdepth 10 -type f -regextype posix-extended -regex ".{$maxLen,}" |
while read filename
do 
	extension=".${filename##*.}"
	baseName="${filename%.*}"
    mv -n "$filename" "${baseName:0:$maxLen}$extension"
	echo "Renamed $filename to ${baseName:0:$maxLen}$extension"
done