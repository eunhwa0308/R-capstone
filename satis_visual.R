# 만족도 데이터 파일 인코딩
Sys.setlocale("LC_ALL","C")
satisfaction =  read.csv("C:\\Users\\eunhwa\\Documents\\R-capstone\\satisfaction.csv", header = T, sep=",",encoding = "UTF-8")
Sys.setlocale("LC_ALL","Korean")

# 만족도 데이터 시각화(geom_point,geom_line)
g<-ggplot(data = satisfaction)+
  scale_x_discrete(limits=c("매우 불만족", "불만족", "보통","만족","매우 만족")) +
  aes(x = satis_name, y = degree_satis_value,color = degree_name, group = degree_name)+
  geom_line(size=1)+
  geom_point(size = 3)
g + labs(title = "첫 직장 만족도",x = "만족도", y = "만족도 비율", color="계열")


#만족도 데이터 시각화(geom_bar)
g<-ggplot(data=  satisfaction, aes(fill=degree_name, y=degree_satis_value, x=satis_name)) +
  scale_fill_brewer(palette = "Set3")+
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label = degree_satis_value ),vjust = 1.5,position=position_dodge(.9), size=3)
g + labs(title = "첫 직장 만족도",x = "만족도", y = "만족도 비율", fill="계열")
