#### 모두의 광장 1페이지: 10페이지의 모든 게시글 크롤링 ####
#1. 모든 페이지의 title,hit,url,content 추출하기
#2. crawl_result.csv, crawl_result.RData 저장
#3. mongodb저장(300개 저장)
#4. for문, if 구문 적절하게 활용

final_data_list = NULL;
for (i in 0:9) {
  url_page <- paste0("https://www.clien.net/service/group/community?&od=T31&po=",i)
  
  url_data_final <- readLines(url_page,encoding = "UTF-8")
  filter_data_final <- url_data_final[str_detect(url_data_final,"subject_fixed")]
  
  title_final <- str_extract(filter_data_final, 
                             pattern = "(?<=\">).*(?=</span>)")
  
  hit_data_final <- url_data_final[str_detect(url_data_final,"<span class=\"hit\">")]
  hit_final <- str_extract(hit_data_final,
                           pattern = "(?<=\">).*(?=</span>)")[-1]
  
  my_url_final <- url_data_final[(which(str_detect(url_data_final,"subject_fixed")) - 3)]
  url_final <- str_extract(my_url_final,
                           pattern = "(?<=href=\").*(?=data-role)")
  url_final <- str_sub(url_final, end = -3)
  url_final <- paste0("https://www.clien.net",url_final)
  
  contentlist = NULL # 최초 변수 선언 시 null로 초기화
  
  for (j in 1:length(url_final)) {
    content_final <- readLines(as.character(url_final[j]),
                               encoding = "UTF-8")
    start_final <- which(str_detect(content_final,"post_content"))
    end_final <- which(str_detect(content_final, "post_ccls"))
    
    content_filter_data_final <- content_final[start_final:end_final]
    content_filter_data_final <- paste(content_filter_data_final,collapse = "")
    
    content_filter_data_final <- gsub("<.*?>","",content_filter_data_final)
    content_filter_data_final <- gsub("\t|&nbsp;","",content_filter_data_final)
    
    contentlist <- c(contentlist, content_filter_data_final)
    
  }
  
  final_data <- cbind(title_final,
                      hit_final,
                      url_final,
                      contentlist)
  final_data_list <- rbind(final_data_list,final_data)
}
class(final_data_list)
write.csv(final_data_list, "crawl_result.csv")

#### db에 저장 ####
library(mongolite)
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")
final_data_list <- data.frame(final_data_list)
con$insert(data = final_data_list)
