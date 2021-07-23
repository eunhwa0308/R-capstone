library(ggplot2)
library(treemap)
library(RColorBrewer)
library("colorspace")
library(tidyverse)
hcl_palettes(plot = TRUE)
## 폰트 설정 패키지 설치
install.packages("extrafont")
library(extrafont)
## 존재하는 모든 폰트 불러오기
font_import()
## 폰트 설정
theme_set(theme_gray(base_family='NanumGothic'))

#색깔 보기
display.brewer.all(n=10, exact.n=F)

#파일 불러오기
Sys.setlocale("LC_ALL","C")
female =  read.csv(file = "C:\\Users\\eunhwa\\Documents\\R-capstone\\emp_female.csv", header = T, sep=",",encoding = "UTF-8")
Sys.setlocale("LC_ALL","Korean")

#데이터 보기
View(female)
head(female)
nrow(female)

#도지 옵션 넣은 시각화
ggplot(data = female)+
  aes(x = degree_name, y = degree_employ_value,
      fill = sex)+
  geom_bar(stat="identity",position = "dodge")+
  scale_fill_brewer(palette = "Pastel1")+  #팔레트로 색상 지정
  theme(plot.title = element_text(hjust = 0.5))+  # 제목 센터로
  geom_text(aes(label=degree_employ_value), vjust=1.5,
            colour="white",
            position=position_dodge(.9),
            size=3)+ #그래프에 수치 표시
  labs(title = '남녀 계열별 취업률 데이터',
            x = '계열',
            y = '취업률',
            fill = '성별') #레이블 지정


# dodge 안넣은 버전
ggplot(data = female)+
  labs(title="employ value bar chart")+
  aes(x = degree_name, y = degree_employ_value,
      fill = sex)+
  geom_bar(stat="identity")+
  scale_fill_brewer(palette = "Pastel1")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_text(aes(label=degree_employ_value), vjust=1.5,
            colour="white",position=position_dodge(.9), size=3)

#트리맵
treemap(female,
        index = c("degree_name","sex"),
        vSize = "degree_employ_value",
        vColor = "degree_employ_value", type = "index",
        bg.labels = "white",
        title="남녀 계열별 취업률 데이터", fontfamily.labels="NanumGothic")+
        theme(plot.title = element_text(hjust = 0.5))

#박스 플롯
Sys.setlocale("LC_ALL","C")
employ_group =  read.csv(file = "C:\\Users\\eunhwa\\Documents\\R-capstone\\employ_group2.csv", header = T, sep=",",encoding = "UTF-8")
Sys.setlocale("LC_ALL","Korean")

#데이터 보기
View(employ_group)
head(employ_group)

  ggplot(employ_group,aes(x = group, y = degree_employ_value,fill=group)) +
  geom_point(color = "black") +           # 점 색상 지정
  geom_boxplot(alpha=0.2)+               # 박스플롯 색상 투명도
  theme(legend.position="none") +       #테마
  theme(plot.title = element_text(hjust = 0.5))+  # 제목 센터로
  scale_fill_brewer(palette="Set2")+         #팔레트로 색상 지정
  labs(title = '학과 & 계열별 취업률 데이터 ',
       x = '계열',
       y = '취업률')    # 레이블과 title 지정

#바이올린
  ggplot(employ_group,aes(x = group, y = degree_employ_value,fill=group)) +
  geom_point(color = "black") +          # 점 색상 지정
  geom_violin(alpha=0.3) +              # 바이올린 색상 투명도
  geom_boxplot(width=0.1)+             #박스 플롯 두께
  theme(legend.position="none") +     #테마
  theme(plot.title = element_text(hjust = 0.5))+  # 제목 센터로
  scale_fill_brewer(palette="Set2")+             #팔레트로 색상 지정
  labs(title = '학과 & 계열별 취업률 데이터 ',
       x = '계열',
       y = '취업률')     # 레이블과 title 지정
