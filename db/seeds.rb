##FAKE QUEENS
Dragqueen.destroy_all
dela = Dragqueen.create(name: "Ben De La Creme", winner: false, place: 5, misscongeniality: true, season: 6, quote: "test test test", image: "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/9/93/DelaS6promo.jpg/revision/latest/scale-to-width-down/350?cb=20161216100811")

##FAKE USERS
User.destroy_all
peyton = User.create(name: "Peyton Doyle")

##FAKE RATINGS
Rating.destroy_all
rating1 = Rating.create(rating: 4, user_id: peyton.id, dragqueen_id: dela.id)

##FAKE COMMENTS
Comment.destroy_all
comment1 = Comment.create(comment: "YO SHE IS THE BEST SEATTLE QUEEN! FIGHT ME!", user_id: peyton.id, dragqueen_id: dela.id)