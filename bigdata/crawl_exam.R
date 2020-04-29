load(file = "crawl_data.RData")
final_data
final_data[,3]

#crawl_content
#final_data의 1번 글의 내용을 출력
class(final_data)
url <- final_data[1,final_data$url]
url <- as.vector(url)
url
class(url)

url_data1 <- readLines(url, encoding = "UTF-8")

filter_data1 <- url_data1[str_detect(url_data1,pattern = "content")]
filter_data1

content <- str_extract(filter_data1,pattern = "(?<=<p>).*(?=</p>)")
class(content)
content <- content[c(-1,-2,-3)]

final_data1 <- cbind(content)
final_data1
write.csv(final_data1,"crawl_exam.csv")

#### 답 ####
library(stringr)
url_list <- final_data[,3]
url_list
contentdata <- readLines(as.character(url_list[1]),encoding = "UTF-8")
class(contentdata)
start <- which(str_detect(contentdata, "post_content"))
end <- which(str_detect(contentdata, "post_ccls"))

content_filter_data <- contentdata[start:end]
content_filter_data

# 데이터 정제하기
#1. 벡터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data,collapse = "")
content_filter_data

#2. 불필요한 기호나 태그 없애기
# 태그 없애기
content_filter_data <- gsub("<.*?>","",content_filter_data)
content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)
content_filter_data

