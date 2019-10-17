require 'rest-client'

# Pulling API and parsing into an arry
queensapi = RestClient.get('http://www.nokeynoshade.party/api/queens/all')
queensapi_array = JSON.parse(queensapi)

# Destroying all queens to start fresh
Dragqueen.destroy_all

# Counters for the iterators below
placecounter = 0
szncounter = 1

# # Helper method for ranking
# def changePlaceToString(place, season)
#   if season == 1 && place == 1
#     "last"
#   else
#     "none"
#   end
# end

# Iterating over parse JSON file to create a new queen
queensapi_array.each do |queen|

 Dragqueen.create(
   name: queen["name"],
   winner: queen["winner"],
   place:
    if (queen["winner"] == true && queen["name"] != "Chad Michaels" && queen["name"] != "Alaska Thunderfuck 5000" && queen["name"] != "Trixie Mattel" && queen["name"] != "Sasha Velour" && queen["name"] != "Aquaria") || queen["name"] == "Shea Coulee" || queen["name"] == "The Vixen"
      placecounter = 0
      0
    else
      placecounter
      placecounter = placecounter + 1
    end,
   misscongeniality: queen["missCongeniality"],
   season:
    if (queen["winner"] == true && queen["name"] != "Chad Michaels" && queen["name"] != "Alaska Thunderfuck 5000" && queen["name"] != "Trixie Mattel" && queen["name"] != "Sasha Velour" && queen["name"] != "Aquaria") || queen["name"] == "Shea Coulee" || queen["name"] == "The Vixen"
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

# FIX SASHA & SHEA
# FIX ALL OF S11

Dragqueen.all.each do |queen|

  new_place = nil
  if (queen.place == "1")
    new_place = "last"
  elsif (queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 9 || queen.season == 10 || queen.season == 11 ) && (queen.place == "2")
    new_place = "thirteenth"
  elsif ((queen.season == 3 || queen.season == 4) && (queen.place == "2")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 9 || queen.season == 10 || queen.season == 11) && (queen.place == "3"))
    new_place = "twelfth"
  elsif ((queen.season == 2 || queen.season == 8) && (queen.place == "2")) || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "3")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7) || queen.season == 10 || queen.season == 11) && (queen.place == "4")
    new_place = "eleventh"
  elsif ((queen.season == 2 || queen.season == 8) && (queen.place == "3")) || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "4")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && (queen.place == "5"))
    new_place = "tenth"
  elsif ((queen.season == 2 || queen.season == 8) && (queen.place == "4")) || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "5")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && (queen.place == "6"))
    new_place = "ninth"
  elsif ((queen.season == 1) && (queen.place == "2")) || (queen.season == 2 || queen.season == 8) && (queen.place == "5") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "6")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "7")
    new_place = "eigth"
  elsif ((queen.season == 1) && (queen.place == "3")) || (queen.season == 2 || queen.season == 8) && (queen.place == "6") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "7")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "8")
    new_place = "seventh"
  elsif ((queen.season == 1) && (queen.place == "4")) || (queen.season == 2 || queen.season == 8) && (queen.place == "7") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "8")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "9")
    new_place = "sixth"
  elsif ((queen.season == 1) && (queen.place == "5")) || (queen.season == 2 || queen.season == 8) && (queen.place == "8") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "9")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "10")
    new_place = "fifth"
  elsif ((queen.season == 1) && (queen.place == "6")) || (queen.season == 2 || queen.season == 8) && (queen.place == "9") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "10")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "11")
    new_place = "fourth"
  elsif ((queen.season == 1) && (queen.place == "7")) || (queen.season == 2 || queen.season == 8) && (queen.place == "10") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "11")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "12")
    new_place = "third"
  elsif ((queen.season == 1) && (queen.place == "8")) || (queen.season == 2 || queen.season == 8) && (queen.place == "11") || ((queen.season == 3 || queen.season == 4 || queen.season == 9) && (queen.place == "12")) || ((queen.season == 5 || queen.season == 6 || queen.season == 7 || queen.season == 10 || queen.season == 11) && queen.place == "13")
    new_place = "second"
  elsif (queen.place == "0")
    new_place = "first ✨"
  end

  queen.update(:place => new_place)

end


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

