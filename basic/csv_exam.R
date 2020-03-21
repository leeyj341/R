#csv는 기본 패키지로 사용가능
#csv를 읽기
mdf <- read.csv(file = "csv_exam.csv")
mdf
mdf[2,]
#dataframe에서 조건에 만족하는 데이터를 조회
m <- matrix(1:20,ncol = 4)
m
d <- data.frame(m)
d
myresult <- d[d$X3 >=13,]
myresult
#조건에 만족하는 데이터를 result.csv로 저장
write.csv(myresult, file = "result.csv")

#미션
examCsv <- mdf[mdf$science>=80,]
str(examCsv)
examCsv$mytotal <- c(sum(examCsv[1,3:5]), sum(examCsv[2,3:5]), sum(examCsv[3,3:5]), sum(examCsv[4,3:5]))
examCsv
examCsv$myavg <- c(mean(as.numeric(examCsv[1,3:5])),mean(as.numeric(examCsv[2,3:5])),mean(as.numeric(examCsv[3,3:5])),mean(as.numeric(examCsv[4,3:5])))
examCsv

#답
examCsv$mytotal <- c(as.numeric(examCsv$math + examCsv$english + examCsv$science))
examCsv
examCsv$myavg <- as.numeric(examCsv$mytotal / 3)
examCsv
write.csv(examCsv, file = "result2.csv")
