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

author_1 = book_1.authors.create(name: "Kathryn Stockett")
author_2 = book_2.authors.create(name: "Justin Cronin")
author_3 = book_3.authors.create(name: "Blake Crouch")

book_4.authors << author_3
book_5.authors << author_3
book_6.authors << author_3


author_4 = book_7.authors.create(name: "Chinua Achebe")
author_5 = book_8.authors.create(name: "Khaled Hosseini")

book_9.authors << author_5
book_10.authors << author_5
book_21.authors << author_9

author_6 = book_11.authors.create(name: "Paula Hawkins")
author_7 = book_12.authors.create(name: "Audrey Niffenegger")
author_8 = book_13.authors.create(name: "Sarah Gruen")
author_9 = book_14.authors.create(name: "Neil Gaiman")
author_10 = book_15.authors.create(name: "Kurt Vonnegut")
author_11 = book_16.authors.create(name: "Elie Wiesel")
author_12 = book_17.authors.create(name: "Robert Galbraith")
book_18.authors << author_12

author_13 = book_19.authors.create(name: "Junot Diaz")
author_14 = book_20.authors.create(name: "Anthony Doerr")
author_15 = book_21.authors.create(name: "Terry Pratchett")
author_16 = book_22.authors.create(name: "Stephenie Meyer")

review_1 = book_2.reviews.create(user: "Mills P.", heading: "Love this book!", full_review: "Such an amazing book- loved readin!", score: 5)
review_2 = book_2.reviews.create(user: "Rob S.", heading: "Pretty good!", full_review: "Kind of rambly, but still really good.", score: 4)
review_3 = book_22.reviews.create(user: "Mills P.", heading: "Just NO.", full_review: "This is the dumbest frickin book ever written. EVER.", score: 1)
review_4 = book_22.reviews.create(user: "Rob S.", heading: "Why?", full_review: "I'm pissed about the trees that went into making this book. Its an ecological travisty.", score: 1)
review_5 = book_1.reviews.create(user: "Sally K.", heading: "Cool!", full_review: "It was pretty good.", score: 4)
review_6 = book_2.reviews.create(user: "Joe B.", heading: "I don't like reading.", full_review: "Wasn't feeling it.", score: 2)
review_7 = book_1.reviews.create(user: "Stella M.", heading: "YES!", full_review: "I want to gently caress this book!", score: 5)
review_8 = book_1.reviews.create(user: "Alex M.", heading: "Right on.", full_review: "That'll do book. That'll do.", score: 3)
review_9 = book_3.reviews.create(user: "Aurie G.", heading: "Total Nightmare", full_review: "There is so much wrong with this book, I don't even know where to start!!!", score: 1)
review_10 = book_3.reviews.create(user: "Brennan A.", heading: "Ok", full_review: "I mean, yea, ok. I wouldn't read it again, but it was cool.", score: 3)
review_11 = book_4.reviews.create(user: "Brian P.", heading: "AWESOME.", full_review: "Legit can't get enough of this book. Can't wait to read it again!", score: 5)
review_12 = book_4.reviews.create(user: "David H.", heading: "Great Read", full_review: "JK- this book SUUUUCKED.", score: 2)
review_13 = book_5.reviews.create(user: "Glynnis O.", heading: "Fine.", full_review: "I hate writing reviews. I don't even know how I ended up on this page.", score: 3)
review_14 = book_5.reviews.create(user: "Patrick D.", heading: "Excellent.", full_review: "I really enjoyed this book- I feel like I was transported to another world- like MIDDLE EARTH!!!", score: 5)
review_15 = book_5.reviews.create(user: "Vince C.", heading: "It's cool, but risky.", full_review: "It's a cool book. You know. Like,...it's alright.", score: 4)
review_16 = book_6.reviews.create(user: "Zach L.", heading: "Perfection.", full_review: "This book really just reached into my soul and just transported me in a way- guys! I couldn't put it down! So good!", score: 5)
review_17 = book_6.reviews.create(user: "Brian P.", heading: "The worst.", full_review: "I lost hours of my life. Granted, I only got to page 10, but seriousy....HOURS OF MY LIFE.", score: 2)
review_18 = book_7.reviews.create(user: "Alexandra C.", heading: "Mediocre.", full_review: "There are books that inspire you, and books that tear your heart to pieces. This book was neither.", score: )
review_19 = book_7.reviews.create(user: "Andrew J.", heading: "Eh.", full_review: "Felt like reading a damn toaster manual, which isn't a bad thing, except that I didn't get a toaster.", score: 3)
review_20 = book_8.reviews.create(user: "Billy U.", heading: "I CAN READ!", full_review: "YOU GUYS! I CAN REAAAAAD!!! Book was ok.", score: 3)
review_21 = book_8.reviews.create(user: "Brian Z.", heading: "Just fine. No more.", full_review: "See above.", score: 3)
review_22 = book_8.reviews.create(user: "Chris D.", heading: "Moving", full_review: "The unforgettable, heartbreaking story of the unlikely friendship between a wealthy boy and the son of his father’s servant, The Kite Runner is a beautifully crafted novel set in a country that is in the process of being destroyed. It is about the power of reading, the price of betrayal, and the possibility of redemption; and an exploration of the power of fathers over sons—their love, their sacrifices, their lies. Wonderful read.", score: )
review_23 = book_9.reviews.create(user: "James C.", heading: "Nice", full_review: "I liked it.", score: 4)
review_24 = book_9.reviews.create(user: "Justin D.", heading: "Ok.", full_review: "I've read better.", score: 3)
review_25 = book_9.reviews.create(user: "Corndog.", heading: "CORN DOOOOOG", full_review: "Reading is boring. I like making memes.", score: 4)
review_26 = book_22.reviews.create(user: "Logan P.", heading: "Total waste of time", full_review: "Don't even bother. Seriously. I'd rather be running into oncomming traffic.", score: 1)
review_27 = book_9.reviews.create(user: "Martha T.", heading: "Riviting!", full_review: "This book was fantastic! A must read!", score: 5)
review_28 = book_9.reviews.create(user: "Martin M.", heading: "Can't say enough!", full_review: "So good.", score: 4)
review_29 = book_10.reviews.create(user: "Santiago C.", heading: "Excellent", full_review: "Loved this book- going to buy a copy for all my friends and family. Seriously, the best!", score: 5)
review_30 = book_10.reviews.create(user: "Smitha H.", heading: "Horrific.", full_review: "If I didn't have to pay the library fee, I'd had set the damn thing on fire.", score: 1)
review_31 = book_11.reviews.create(user: "Billy H.", heading: "Yea, it's ok.", full_review: "Sure. Why not. You have 7 hours of your life you don't particularly care about? Read this.", score: 3)
review_32 = book_11.reviews.create(user: "Megan M.", heading: "Very nice.", full_review: "This was a pleasant read, but I wouldn't say it's the best. Its.....nice.", score: 4)
review_33 = book_12.reviews.create(user: "Michael K", heading: "Dude.", full_review: "I like have 10,000 other things I'd rather be doing than readin a damn book, but THIS BOOK. THIS BOOK MAN.....masterpiece!", score: 5)
review_34 = book_12.reviews.create(user: "Ryan M.", heading: "THE WORST", full_review: "Don't believe what you've heard. This book is the dumbest.", score: 2)
review_35 = book_13.reviews.create(user: "Matt W.", heading: "Ehhhhh.", full_review: "Tollerable.", score: 2)
review_36 = book_14.reviews.create(user: "Matt L. ", heading: "no.", full_review: "I'm done. I'm throwing away my library card cause of this bs. I'm over it.", score: 1)
review_37 = book_15.reviews.create(user: "Chi T.", heading: "So good!!", full_review: "OH MY GOD I LOVE THIS BOOOOK!!!!!!!", score: 4)
review_38 = book_15.reviews.create(user: "Rob S. ", heading: "Bruh.", full_review: "Tight book.", score: 5)
review_39 = book_16.reviews.create(user: "Mills P", heading: "Yup", full_review: "Dug it.", score: 4)
review_40 = book_16.reviews.create(user: "Alec A", heading: "SO GOOD", full_review: "This was enjoyable!", score: 5)
review_41 = book_16.reviews.create(user: "Carrie W", heading: "Pristine", full_review: "Excellent read!", score: 4)
review_42 = book_17.reviews.create(user: "Stella M.", heading: "HELL YEA!", full_review: "Oh this book.....this book just ...it was like a punch in the gut! SO GOOD! Love it!", score: 5)
review_43 = book_18.reviews.create(user: "Person", heading: "I can't", full_review: "I'm out. I got nothing else.", score: 2)
review_44 = book_18.reviews.create(user: "Robot", heading: "I am a robot", full_review: "01101010110001010100110110101001011", score: 1)
review_45 = book_19.reviews.create(user: "Out of Names", heading: "Out of titles", full_review: "Out of full reviews", score: 3)
