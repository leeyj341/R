install.packages("stringr")
library("stringr")
#패턴
mytext <- "    test$uuuuu"
mytext2 <- "https://cran.r-project.org/"
#패턴과 일치하는 문자열 리턴
str_extract(mytext2,".+(:)")
#패턴과 일치하는 문자를 찾아 일치 문자 바로 전까지 리턴
str_extract(mytext2,".+(?=:)") 
str_extract(mytext,".+(?=\\$)") #전방탐색 (?=)
str_extract(mytext,"(?<=\\$).*") #후방탐색 (?<=)

#문자열 관련 함수
#paste - 벡터를 연결해서 하나의 문자열로 보여줄 때 사용
#paste0 - 여러 개를 연결결
str <- c("java", "hadoop", "R", "mongodb")
paste(str, collapse = ",")
paste0(mytext, mytext2)
#문자열안의 특정 문자열을 replace
data <- gsub("u","","mytext");
data
str_trim(data)
