####text mining with amazon review####################
library(rvest)
library(XML)
library(magrittr)
### ###https://www.amazon.in/Apple-iPhone-11-64GB-Green/product-reviews/B07XVKBY68?reviewerType=all_reviews
aurl<-"https://www.amazon.in/Apple-iPhone-11-64GB-Green/product-reviews/B07XVKBY68?reviewerType=all_reviews"
amazon_reviews<-NULL
for (i in 1:15){
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev<- murl %>%
    html_nodes(".review-text") %>%
    html_text()
  amazon_reviews<-c(amazon_reviews,rev)
}

length(amazon_reviews)
write.table(amazon_reviews,"iphoneX.text",row.names = F)
getwd()

#install.packages("syuzhet")
library(syuzhet)
library(lubridate,ggplot2)
library(ggplot2)
library(scales)
library(dplyr)
library(reshape2)

#############################Sentiment analysis##################################
#txt = readLines("C:/Users/User/Desktop/New folder/iphoneX.txt")
txt=iphoneX

txt <- iconv(txt, "UTF-8")

x<-get_nrc_sentiment(txt)
head(x,n=5)

txt[4]
get_nrc_sentiment('happy')
get_nrc_sentiment('Negative')

get_sentiment('Negative',method="afinn")
get_sentiment('happy',method="afinn")

#each sentences by eight
example<-get_sentences(txt)
nrc_data<-get_nrc_sentiment(example)

#bar plot for emotion mining
windows()
barplot(colSums(nrc_data), las=1, col=rainbow(10),ylab='count',main='Emotion scores')


sentiment_vector<-get_sentiment(example,method="bing")
sentiment_afinn<-get_sentiment(example,method="afinn")
sentiment_nrc<-get_sentiment(example,method="nrc")

sum(sentiment_afinn)
mean(sentiment_afinn)
summary(sentiment_afinn)

windows()
plot(sentiment_vector,type='l',maim='Plot trajectory', xlab='Narative time',ylab='Emotional valence')
abline(h=0,color='red')

plot(
  sentiment_vector,
  type="h",
  main="Example Plot Trajectory",
  xlab="Narrative Time",
  ylab="Emotinal Valence"
)
get_transformed_values()

#Shape smoothing
ft_values <-get_transformed_values(
  sentiment_vector,
  low_pass_size=3,
  x_reverse_len=100,
  padding_factor=2,
  scale_vals=TRUE,
  scale_range= FALSE
)
ft_values<-get_transformed_values(sentiment_vector,
                                  low_pass_size=3,
                                  x_reverse_len=100,
                                  padding_factor=2,
                                  scale_vals=TRUE,
                                  scale_range= FALSE)
plot(
  ft_values,
  type="l",
  main="IhopneX",
  xlab="Narrative Time",
  ylab="Emotional Valence",
  col='blue')
   )



