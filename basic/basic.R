#R에서 사용하는 주석문
num = 100 #num이 100이다.
num
num <- 1000 #num 변수에 1000을 저장하라는 의미
num
num == 1000 #num이 1000과 같은지 비교 TRUE, FALSE(T, F도 가능)
num == 100
num != 1000
num > 100
num < 100

test <- "myR"
test
test <- myR
myR <- num
test <- myR
test
"fsdfddsfdsfd"


result1 <- 100 #숫자형
result1
result2 <- "test" #문자형
result2

#R에서 제공되는 함수를 이용할 수 있으며
#class함수는 타입을 확인
class(result1)
class(result2)
test <- as.character(result1)
test
test <- as.numeric(result1)
test
