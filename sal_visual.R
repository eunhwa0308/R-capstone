library(ggplot2)

# 색상 팔레트 패키지
library(RColorBrewer)

# 임금 데이터 파일 불러오기
Sys.setlocale("LC_ALL","C")
salary =  read.csv(file = "C:\\Users\\eunhwa\\Documents\\R-capstone\\salary.csv", header = T, sep=",",encoding = "UTF-8")
Sys.setlocale("LC_ALL","Korean")

#팔레트 출력
display.brewer.all(n=10, exact.n=F)

# 임금 데이터 시각화(geom_point,geom_line)
p<-ggplot(data = salary)+
  scale_x_discrete(limits=c("0~50만원", "51~100만원", "101~150만원","151~200만원","201~250만원","251~300만원","301만원 이상","500만원이상")) +
  aes(x = salary_name, y = degree_salary_value,color = degree_name, group = degree_name )+
  scale_fill_brewer(palette = "Set3")+
  geom_point(size = 3,stat="identity")+
  geom_line(size=1)
p + labs(title = "첫 직장 월평균 임금",x = "임금", y = "임금 구간 비율",color ="학과")


# 임금 데이터 시각화(geom_bar)
p<-ggplot(salary) +
  scale_x_discrete(limits=c("0~50만원", "51~100만원", "101~150만원","151~200만원","201~250만원","251~300만원","301만원 이상","500만원이상")) +
  aes(x =salary_name,y =degree_salary_value)+
  geom_bar(aes(col=degree_name), position="identity", alpha=0.1,stat ="identity" )
p + labs(title = "첫 직장 월평균 임금",x = "임금", y = "임금 구간 비율",color ="학과")




