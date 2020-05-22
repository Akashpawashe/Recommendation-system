#install.packages("recommenderlab", dependencies = TRUE)
#install.packages("Matrix")
library(recommenderlab)
library(caTools)
library(Matrix)

book <- read.csv("D:\\excelR\\Data science notes\\Recomendewr sys\\asgmnt\\books.csv")
str(book)

hist(book$rating)    # distribution

books1<- book[,c(4,6)]
books1
books2<- book[,c(5,6)]
books2

book_matrix_author <- as(books1,'realRatingMatrix')
book_matrix_author

#popularity based
bookmodel1 <- Recommender(book_matrix_author, method='popular')

#prediction 
recomm_books1 <- predict(bookmodel1, book_matrix_author[524:525],n=5)
as(recomm_books1,'list')

#Collaborative Filtering


bookmodel2 <- Recommender(book_matrix_author, method="UBCF")

#Predictions for two users 
recomm_books2 <- predict(bookmodel2, book_matrix_author[524:525], n=5)
as(recomm_books2, 'list')

book_matrix_publisher <- as(books2,'realRatingMatrix')
book_matrix_publisher

#popularity based
bookmodel1 <- Recommender(book_matrix_publisher, method='popular')

#prediction 
recomm_books1 <- predict(bookmodel1, book_matrix_publisher[524:527],n=5)
as(recomm_books1,'list')

#Collaborative Filtering


bookmodel2 <- Recommender(book_matrix_publisher, method="UBCF")

#Predictions for two users 
recomm_books2 <- predict(bookmodel2, book_matrix_publisher[524:527], n=5)
as(recomm_books2, 'list')


