#!/bin/bash

targetDir=/tmp/
folderName=script1

scanDir=/tmp/script1

echo "Hello user this is an antivirus file"

#watch kullanılabilir

cd /var/log/
touch av.log


for number in {1..500000}
do
        cd "${targetDir}/${folderName}/"
        md5=($(md5sum "${number}.exe"))
        #echo "md5 hash of ${number}.exe"
        #echo "md5 hash of ${number}.exe"
        #echo $md5
        #echo "----"
        #"${number}.exe"
        if [ $md5 == "d6ea69a5401ef7e5e953c0edaa16cd50" ]
        then
                detHost=$(stat -c %U "${number}.exe")

                #echo "Ben ifin icine girdim"
                cd /var/log/
                now=$(date)
                #detHost=$(stat -c %U "${number}.exe")
                user="$USER"

                echo "Tespit zamani: ${now}" >> "av.log"
                echo "Tespit edilen host: ${detHost}" >> "av.log"
                echo "Tespit eden user: ${user}" >> "av.log"
                echo "Dosyanın hash degeri: ${md5}" >> "av.log"
                echo "Dosya konumu: ${scanDir}/${number}.exe" >> "av.log"
        fi
done
