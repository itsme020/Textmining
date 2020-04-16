#Twitter tweets extraction

#install.packages("twitteR")
#install.packages("ROAuth")
#install.packages("base64enc")
#install.packages("httpuv")
library("twitteR")
library("ROAuth")
library("base64enc")
library("httpuv")



###https://apps.twitter.com


cred <- OAuthFactory$new(consumerKey='9fdyRJxWFjLYQrgFGMirnCOvR',
            consumerSecret='WQsiV5u5IEojqSMUwgj0lAW7d0A7E6CgSkWwBCGrDdIq9INlBs',
                   requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')
save(cred, file="twitter authentication.Rdata")
load("twitter authentication.Rdata")

setup_twitter_oauth("9fdyRJxWFjLYQrgFGMirnCOvR", 
                    "WQsiV5u5IEojqSMUwgj0lAW7d0A7E6CgSkWwBCGrDdIq9INlBs",
                    "1241046683162521600-0lkgYidoIK9BSK7gHwBottw6ND3qtc", # Access token
                    "XHAww03kkG4SvISgJ7azm8UNpu7MH6UXv5su6lWsvDR6Z")  # Access token secret key

Tweets <- userTimeline('RNTata2000', n = 1000)

TweetsDF <- twListToDF(Tweets)
write.csv(TweetsDF, "Tweet-Ratantata.csv")


###Search with a key word Covid -19

RatanTatatweets<- searchTwitter('COVID-19', n=20, lang="en", resultType = "recent")
write.csv(RatanTatatweets, "Tweet1-Ratantata.test")


