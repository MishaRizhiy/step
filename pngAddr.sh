#! /bin/bash
#^
url="https://postcode.in.ua/ua/codes/city/1007/a"
curl $url | grep -i "text_tab_1"| grep -oE "https://postcode.in.ua/ua/codes/city/1007/street/[0-9]+" > adresa
while read line
do
curl $line | grep -oE "https://postcode.in.ua/images/image_c.php\?id=[0-9]+" >> adresapng
done < adresa
while read line
do
wget -P /root/linux/Images/ "$line"
done < adresapng

count=0
p=.png
png="`ls /root/linux/Images`"
for line in $png;
do
count=$((count+1))
mv /root/linux/Images/"$line" Images/"IMG$count$p"
done
