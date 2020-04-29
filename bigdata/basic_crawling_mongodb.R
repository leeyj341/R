install.packages("mongolite")
library("mongolite")
library("stringr")

#mongodb에 저장하기 위해서는 크롤링해야 한다.
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")

url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
url_data <- readLines(url, encoding = "UTF-8")
url_data
#정보확인 -----------------------------
#class(url_data)
#length(url_data)

#head(url_data)
#tail(url_data)
#--------------------------------------
url_data[200]
#조건에 만족하는 데이터를 필터링
#문자열에 패턴을 적용해서 일치여부를 T/F로 리턴

#### 데이터 필터링(title) #### 
#1. str_detect(패턴을 검사할 문자열, 패턴)을 이용해서 웹페이지 전체에서 필요한 데이터만 먼저 추출
filter_data <- url_data[str_detect(url_data, "subject_fixed")]
str_detect(url_data, "subject_title")

#2. 추출한 데이터 전체에서 내가 필요한 문자열만 다시 추출
#str_extract -> 패턴에 일치하는 문자열을 리턴
#후방, 전방 탐색 정규 표현식
title <- str_extract(filter_data, pattern = "(?<=\">).*(?=</span>)")
title

#### 데이터 필터링(hit) ####
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
hit_data
hit <- str_extract(hit_data,pattern = "(?<=\">).*(?=</span>)")[-1]
hit

#### 데이터 필터링(url) ####
which(str_detect(url_data,"subject_fixed"))
my_url <- url_data[(which(str_detect(url_data,"subject_fixed")) - 3)]
my_url
url <- str_extract(my_url,pattern = "(?<=href=\").*(?=data-role)")
url
#필요없는 문자열을 잘라내기 -end = -3 : 뒤에서 3개를 잘라내기
url <- str_sub(url, end = -3)
url <- paste0("https://www.clien.net",url)
url

#### csv 파일로 생성 ####
final_data <- cbind(title,hit,url)
final_data

write.csv(final_data,"crawl_data.csv")
save(final_data, file = "crawl_data.RData")
length(title)
length(hit)
length(url)

#### mongodb에 저장하기 ####
if(con$count()>0) {
  con$drop()
}
class(final_data)
# mongodb에 데이터를 저장하기 위해서 dataframe으로 변환
final_data <- data.frame(final_data)
final_data
con$insert(data = final_data)
