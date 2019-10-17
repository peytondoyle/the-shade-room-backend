require 'rest-client'

# Pulling API and parsing into an arry
queensapi = RestClient.get('http://www.nokeynoshade.party/api/queens/all')
queensapi_array = JSON.parse(queensapi)

# Destroying all queens to start fresh
Dragqueen.destroy_all

# Counters for the iterators below
placecounter = 0
szncounter = 1

# Iterating over parse JSON file to create a new queen
queensapi_array.each do |queen|

 Dragqueen.create(
   name: queen["name"],
   winner: queen["winner"],
   place:
    if queen["winner"] == true
      placecounter = 1
      0
    else
      placecounter
      placecounter = placecounter + 1
    end,
   misscongeniality: queen["missCongeniality"],
   season:
    if queen["winner"] == true && queen["name"] != "Chad Michaels" && queen["name"] != "Alaska Thunderfuck 5000" && queen["name"] != "Trixie Mattel"
      szncounter = szncounter + 1
      result = szncounter - 1
      result
    else
      szncounter
    end,
   quote: queen["quote"],
   image: queen["image_url"]
 )
end

# 
# last = "last"
# tenth = "tenth"
# none = "none"
#
# queensapi_array.each do |queen|
#   Dragqueen.update(place:
#     if queen["season"] == 1 && queen["place"] == 1
#       last
#     elsif queen["season"] == 1 && queen["place"] == 2
#       tenth
#     else
#       none
#     end)
# end


##FAKE QUEENS
# Dragqueen.destroy_all
# dela = Dragqueen.create(name: "Ben De La Creme", winner: false, place: 5, misscongeniality: true, season: 6, quote: "test test test", image: "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/9/93/DelaS6promo.jpg/revision/latest/scale-to-width-down/350?cb=20161216100811")

##FAKE USERS
# User.destroy_all
# peyton = User.create(name: "Peyton Doyle")

##FAKE RATINGS
# Rating.destroy_all
# rating1 = Rating.create(rating: 4, user_id: peyton.id, dragqueen_id: dela.id)

##FAKE COMMENTS
# Comment.destroy_all
# comment1 = Comment.create(comment: "YO SHE IS THE BEST SEATTLE QUEEN! FIGHT ME!", user_id: peyton.id, dragqueen_id: dela.id)

