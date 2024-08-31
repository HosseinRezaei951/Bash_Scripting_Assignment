#! /usr/bin/bash

date=`date +'%Y-%b-%d'`
path=`pwd`
resultFolder_path="${path}/CrawlerResults"
todayResultFolder_path="${resultFolder_path}/${date}"

# Check the directory is exists or not
if [[ ! -d $resultFolder_path ]]; then
    # if not exists create it 
    mkdir "$resultFolder_path"
fi

# Check the directory is exists or not
if [[ ! -d $todayResultFolder_path ]]; then
    # if not exists create it 
    mkdir "$todayResultFolder_path"
fi

webData=$(wget -O - "https://www.isna.ir/service/Science-Academia")
newsLinks_arr=($(echo "$webData" | grep -Po '(?<=<h3><a href="/news/)(.*?)(?=")'))


fileNumber=(`seq -w 1 10`)
for (( i=0; i<10; i++ )); do
    tmp_resultFile="${todayResultFolder_path}/${fileNumber[i]}.txt"
    
    tmp_webData="$(wget -O - "https://www.isna.ir/news/${newsLinks_arr[i]}")"
    tmp_newsTitle=$(echo "$tmp_webData" | grep -Po '(?<=<h1 class="first-title" itemprop="headline">)(.*?)(?=</h1>)')
    tmp_newsText=$(echo "$tmp_webData" | grep -Po '(?<=<p>)(.*?)(?=</p>)')
    
    > "$tmp_resultFile"
    echo "$tmp_newsTitle" >> "$tmp_resultFile"
    echo " " >> "$tmp_resultFile"
    echo "$tmp_newsText" >> "$tmp_resultFile"
done


webData2=$(wget -O - "https://news.yahoo.com/world/")
newsLinks_arr2=($(echo "$webData2" | grep -Po '(?<=not-isInStreamVideoEnabled" href="/)(.*?)(?=")'))


fileNumber2=(`seq -w 11 20`)
for (( i=0; i<10; i++ )); do
    tmp_resultFile2="${todayResultFolder_path}/${fileNumber2[i]}.txt"
    
    tmp_webData2="$(wget -O - "https://news.yahoo.com/${newsLinks_arr2[i]}")"
    tmp_newsTitle2=$(echo "$tmp_webData2" | grep -Po '(?<=<h1 data-test-locator="headline">)(.*?)(?=</h1>)')
    tmp_newsText2=$(echo "$tmp_webData2" | grep -Po '(?<=<p>)(.*?)(?=</p>)')
    
    > "$tmp_resultFile2"
    echo "$tmp_newsTitle2" >> "$tmp_resultFile2"
    echo " " >> "$tmp_resultFile2"
    echo "$tmp_newsText2" >> "$tmp_resultFile2"
done