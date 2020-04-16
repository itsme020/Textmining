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

###############################################################

######## Movie Review from IMDB Site######################
########### Bajirao Mastani#####################
aurl <- "https://www.imdb.com/title/tt3735246/reviews?ref_=tt_ov_rt"
IMDB_reviews <- NULL
for (i in 1:10){
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev <- murl %>%
    html_nodes(".show-more__control") %>%
    html_text()
  IMDB_reviews <- c(IMDB_reviews,rev)
}
length(IMDB_reviews)
## [1] 750

write.table(IMDB_reviews,"bajirao_mastani",row.names = F)
########################################################################################################
#Download extract data from bajirao mastani review
View(bajirao_mastani)

txt=bajirao_mastani

txt <- iconv(txt, "UTF-8")

x<-get_nrc_sentiment(txt)
head(x,n=5)

txt[1]
get_nrc_sentiment('good')
get_nrc_sentiment('boring')

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
  main="MovieReview",
  xlab="Narrative Time",
  ylab="Emotional Valence",
  col='blue')
       )






########### Uri: The Surgical Strike#####################

aurl <- "https://www.imdb.com/title/tt8291224/reviews?ref_=tt_ov_rt"
IMDB_reviews <- NULL
for (i in 1:20){
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev <- murl %>%
    html_nodes(".show-more__control") %>%
    html_text()
  IMDB_reviews <- c(IMDB_reviews,rev)
}
length(IMDB_reviews)
## [1] 1500
write.table(IMDB_reviews,"URI",row.names = F)
##############################Snapdeal############################

aurl <- "https://www.snapdeal.com/product/fastrack-3121sm01-men-watch/15579855/reviews?page=2&vsrc=rcnt"


snapdeal_reviews <- NULL
for (i in 1:30){
  aurl <- read_html(as.character(paste(aurl,sep=as.character(i))))
  srev <- aurl %>%
    html_nodes("#defaultReviewsCard p") %>%
    html_text()
  snapdeal_reviews <- c(snapdeal_reviews,srev)
}
length(snapdeal_reviews)
##[1] 300
write.table(snapdeal_reviews,"fastrack.txt",row.names = FALSE)
getwd()
