book_1 = Book.create(title: "The Help", pub_year: 2009, pages: 465, thumb_url: "https://images.ecosia.org/lCYDpCfp7QOz6POp6Bh7Spid21w=/0x390/smart/https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2Fthumb%2Fe%2Fef%2FThehelpbookcover.jpg%2F220px-Thehelpbookcover.jpg")
book_2 = Book.create(title: "The Passage" , pub_year: 2010 , pages: 776, thumb_url: "https://images.gr-assets.com/books/1327874267l/6690798.jpg")
book_3 = Book.create(title: "Dark Matter" , pub_year: 2016 , pages: 342, thumb_url: "https://images.gr-assets.com/books/1472119680l/27833670.jpg")
book_4 = Book.create(title: "Pines" , pub_year: 2012 , pages: 305, thumb_url: "https://images.gr-assets.com/books/1471617928l/15096164.jpg")
book_5 = Book.create(title: "Wayward" , pub_year: 2013, pages: 298, thumb_url: "https://images.gr-assets.com/books/1388363926l/17920175.jpg")
book_6 = Book.create(title: "The Last Town", pub_year: 2014, pages: 308 , thumb_url: "https://images.gr-assets.com/books/1399508172l/20423680.jpg")
book_7 = Book.create(title: "Things Fall Apart" , pub_year: 1994 , pages: 209, thumb_url: "https://images.gr-assets.com/books/1352082529l/37781.jpg")
book_8 = Book.create(title: "A Thousand Splindid Suns", pub_year: 2007, pages: 372, thumb_url: "https://images.gr-assets.com/books/1345958969l/128029.jpg")
book_9 = Book.create(title: "The Kite Runner", pub_year: 2004, pages: 371, thumb_url: "https://images.gr-assets.com/books/1546093833l/77203.jpg")
book_10 = Book.create(title: "And the Mountains Echoed", pub_year: 2013, pages: 404, thumb_url: "https://images.gr-assets.com/books/1358190204l/16115612.jpg")
book_11 = Book.create(title: "The Girl on the Train", pub_year: 2015, pages: 323, thumb_url: "https://images.gr-assets.com/books/1490903702l/22557272.jpg")
book_12 = Book.create(title: "The Time Traveler's Wife", pub_year: 2013, pages: 500, thumb_url: "https://images.gr-assets.com/books/1380660571l/18619684.jpg")
book_13 = Book.create(title: "Water for Elephants", pub_year: 2007, pages: 335, thumb_url: "https://images.gr-assets.com/books/1494428973l/43641.jpg")
book_14 = Book.create(title: "Neverwhere", pub_year: 2007, pages: 224, thumb_url: "https://images.gr-assets.com/books/1309582431l/14498.jpg")
book_15 = Book.create(title: "Breakfast of Champions", pub_year: 1973, pages: 303, thumb_url: "https://images.gr-assets.com/books/1327934446l/4980.jpg")
book_16 = Book.create(title: "Night", pub_year: 1961, pages: 109, thumb_url: "https://images.gr-assets.com/books/1422507794l/11168.jpg")
book_17 = Book.create(title: "The Cuckoo's Calling", pub_year: 2013, pages: 455, thumb_url: "https://images.gr-assets.com/books/1540217136l/16160797.jpg")
book_18 = Book.create(title: "The Silkworm", pub_year: 2014, pages: 455, thumb_url: "https://images.gr-assets.com/books/1540217126l/18214414.jpg")
book_19 = Book.create(title: "The Brief Wonderious Life of Oscar Wao", pub_year: 2007, pages: 335, thumb_url: "https://images.gr-assets.com/books/1391409748l/297673.jpg")
book_20 = Book.create(title: "All the Light We Cannot See", pub_year: 2014, pages: 531, thumb_url: "https://images.gr-assets.com/books/1440903901l/19398490.jpg")
book_21 = Book.create(title: "Good Omens", pub_year: 2006, pages: 412, thumb_url: "https://b9r8e6p9.stackpathcdn.com/wp-content/uploads/2015/10/Good-Omens.jpg")
book_22 = Book.create(title: "Twilight", pub_year: 2006, pages: 498, thumb_url: "https://images.gr-assets.com/books/1361039443l/41865.jpg")

author_1 = book_1.author.create(name: "Kathryn Stockett")
author_2 = book_2.author.create(name: "Justin Cronin")
author_3 = book_3.author.create(name: "Blake Crouch")

book_4.authors << author_3
book_5.authors << author_3
book_6.authors << author_3


author_4 = book_7.author.create(name: "Chinua Achebe")
author_5 = book_8.author.create(name: "Khaled Hosseini")

book_9.authors << author_5
book_10.authors << author_5
book_21.authors << author_9

author_6 = book_11.author.create(name: "Paula Hawkins")
author_7 = book_12.author.create(name: "Audrey Niffenegger")
author_8 = book_13.author.create(name: "Sarah Gruen")
author_9 = book_14.author.create(name: "Neil Gaiman")
author_10 = book_15.author.create(name: "Kurt Vonnegut")
author_11 = book_16.author.create(name: "Elie Wiesel")
author_12 = book_17.author.create(name: "Robert Galbraith")
book_18.authors << author_12

author_13 = book_19.author.create(name: "Junot Diaz")
author_14 = book_20.author.create(name: "Anthony Doerr")
author_15 = book_21.author.create(name: "Terry Pratchett")
author_16 = book_22.author.create(name: "Stephenie Meyer")

review_1 = book_2.reviews.create(user: "Mills P.", heading: "Love this book!", full_review: "Such an amazing book- loved readin!", score: 5)
review_2 = book_2.reviews.create(user: "Rob S.", heading: "Pretty good!", full_review: "Kind of rambly, but still really good.", score: 4)
review_3 = book_22.reviews.create(user: "Mills P.", heading: "Just NO.", full_review: "This is the dumbest frickin book ever written. EVER.", score: 1)
review_4 = book_22.reviews.create(user: "Rob S.", heading: "Why?", full_review: "I'm pissed about the trees that went into making this book. Its an ecological travisty.", score: 1)
review_5 = book_1.reviews.create(user: "Sally K.", heading: "Cool!", full_review: "It was pretty good.", score: 4)
review_6 = book_2.reviews.create(user: "Joe B.", heading: "I don't like reading.", full_review: "Wasn't feeling it.", score: 2)
