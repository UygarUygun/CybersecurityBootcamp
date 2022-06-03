#!/bin/bash

targetDir=/tmp/
folderName=script1
fileName=0


echo "Hello user this is a virus file"

cd $targetDir
mkdir $folderName

echo "I created a directory in " $targetDir

cd "${folderName}/"

for number in {1..500000}
do
        touch "${number}.exe"
        echo $number >> "$number.exe"
done


echo "I also created two matching files with different hash values"

touch "file1.txt"
touch "file2.txt"

echo "12345" >> "file1.txt"
echo '12345 ' >> "file2.txt"