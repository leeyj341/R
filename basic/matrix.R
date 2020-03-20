#행렬
matrix(1:15)
? matrix
mymat1 <- matrix(1:15, ncol=3)
mymat1
mymat1 <- matrix(1:15,ncol=3,byrow = T)
mymat1
mymat1[2,2] # 행 열
mymat1[1,c(1:3)]
mymat1[1,]
mymat1[,1]
# 1행과 3행을 뺀 데이터
mymat1[c(-1,-3),]
# 1행관 3행 데이터
mymat1[c(1,3),]
# 미니실습1 - 2행부터 4행까지 출력 단, 2번 3번 열만
mymat1[c(2:4),c(2,3)]
# cbind는 컬럼을 추가하는 함수 <- 값이 부족하면 맨 앞의 값이 채워진다.
#rbind는 row를 추가하는 함수
addmymat1 <- cbind(mymat1,c(1, 11, 111, 1111))
addmymat1
addmymat2 <- rbind(mymat1,c(1,11,111,1111))
addmymat2
colnames(mymat1) <-  c("a", "b", "c")
mymat1
rownames(mymat1) <- c("r1","r2","r3","r4","r5")
mymat1
mean(mymat1)
mymat2 <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90), ncol = 4,byrow = T)
mymat2
colnames(mymat2) <- c("국어","영어","과학","수학")
rownames(mymat2) <- c("kim","lee","hong","jang")
avg_name <- c(mean(mymat2[1,]),mean(mymat2[2,]),mean(mymat2[3,]),mean(mymat2[4,]))
avg_name
avg_subject <- c(mean(mymat2[,1]),mean(mymat2[,2]),mean(mymat2[,3]),mean(mymat2[,4]))
avg_subject     
