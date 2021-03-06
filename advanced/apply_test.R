data(package="MASS") #R내부의 샘플데이터 셋을 가져오기
library(MASS)
data("Boston")
head(Boston)
t(t(colnames(Boston)))
df <- head(Boston[,1:7])
#반복작업을 할 때 사용할 수 있도록 함수를 지원
#margin = 1 : 행방향으로, 2 : 열방향으로
df[,"total"] <- apply(X = df, MARGIN = 1, FUN = "sum")
df
df[,"avg"] <- apply(X = df, MARGIN = 1, FUN = "mean")
df
round(apply(X = df, MARGIN = 2, FUN = "sum"), 4)
round(apply(X = df, MARGIN = 2, FUN = "mean"), 4)

#apply()의 margin속성을 2로 정의
sapply(X = df,FUN = "mean")
sapply(X = df,FUN = "mean")
t(t(sapply(X = df,FUN = "class")))
