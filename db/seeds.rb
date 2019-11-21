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

# UPDATING INCORRECT PLACEMENTS OF QUEENS
# THERE IS NO S10 2nd PLACE (should be Eureka)

sasha = Dragqueen.find_by(name: "Sasha Velour")
sasha.update(:place => 0)

shea = Dragqueen.find_by(name: "Shea Coulee")
shea.update(:place => 12)

aquaria = Dragqueen.find_by(name: "Aquaria")
aquaria.update(:place => 0)

miz = Dragqueen.find_by(name: "Miz Cracker")
miz.update(:place => 10)

yuhua = Dragqueen.find_by(name: "Yuhua Hamasaki")
yuhua.update(:place => 3, :image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/c/c5/YuhuaS10.jpg/revision/latest/scale-to-width-down/1000?cb=20180223052431")

dusty = Dragqueen.find_by(name: "Dusty Rae Bottoms")
dusty.update(:place => 4)

monet = Dragqueen.find_by(name: "Monet X Change")
monet.update(:place => 9)

asia = Dragqueen.find_by(name: "Asia O'Hara")
asia.update(:place => 11)

blair = Dragqueen.find_by(name: "Blair St. Clair")
blair.update(:place => 6)

kalorie = Dragqueen.find_by(name: "Kalorie Karbdashian Williams")
kalorie.update(:place => 2)

kameron = Dragqueen.find_by(name: "Kameron Michaels")
kameron.update(:place => 12)

mayhem = Dragqueen.find_by(name: "Mayhem Miller")
mayhem.update(:place => 5)

monique = Dragqueen.find_by(name: "Monique Heart")
monique.update(:place => 7)

vanjie = Dragqueen.find_by(name: "Vanessa Vanjie Mateo")
vanjie.update(:place => 1)

vixen = Dragqueen.find_by(name: "The Vixen")
vixen.update(:place => 8)

# UPDATING UNFORTUNATE IMAGES

Dragqueen.find_by(name: "Tempest DuJour").update(:image => "https://i.ibb.co/6DLfBR6/Tempest-Du-Jour.png")
Dragqueen.find_by(name: "Sasha Belle").update(:image => "https://i.ibb.co/5jK8vcQ/Sasha-Belle.png")
Dragqueen.find_by(name: "Jasmine Masters").update(:image => "https://i.ibb.co/RzBHG0Q/Jasmine-Masters.png")
Dragqueen.find_by(name: "Mrs. Kasha Davis").update(:image => "https://i.ibb.co/FWzkjM9/Mrs-Kasha-Davis.png")
Dragqueen.find_by(name: "Kandy Ho").update(:image => "https://i.ibb.co/k1pLB46/KandyHo.png")
Dragqueen.find_by(name: "Max").update(:image => "https://i.ibb.co/Tb02ncy/Max.png")
Dragqueen.find_by(name: "Jaidynn Diore Fierce").update(:image => "https://i.ibb.co/k9rN2mY/Jaidynn-Diore-Fierce.png")
Dragqueen.find_by(name: "Miss Fame").update(:image => "https://i.ibb.co/chwF5mN/MissFame.png")
Dragqueen.find_by(name: "Trixie Mattel").update(:image => "https://i.ibb.co/mcHkXrC/Trixie-Mattel.png")
Dragqueen.find_by(name: "Katya Zamolodchikova").update(:image => "https://i.ibb.co/s273TsQ/Katya.png")
Dragqueen.find_by(name: "Kennedy Davenport").update(:image => "https://i.ibb.co/S6579mx/Kennedy-Davenport.png")
Dragqueen.find_by(name: "Pearl").update(:image => "https://i.ibb.co/sJnVbzd/Pearl.png")
Dragqueen.find_by(name: "Ginger Minj").update(:image => "https://i.ibb.co/PT7Ryhp/Ginger-Minj.png")
Dragqueen.find_by(name: "Violet Chachki").update(:image => "https://i.ibb.co/WyFnTkJ/Violet-Chachki.png")

# CHANGING ALLSTARS WINNERS TO LOSERS
Dragqueen.find_by(name: "Trixie Mattel").update(:winner => false)
Dragqueen.find_by(name: "Alaska Thunderfuck 5000").update(:winner => false)
Dragqueen.find_by(name: "Chad Michaels").update(:winner => false)

# UPDATING S8 IMAGES
Dragqueen.find_by(name: "Bob the Drag Queen").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/0/0d/BobFullS8.jpg/revision/latest/scale-to-width-down/694?cb=20180622041118")
Dragqueen.find_by(name: "Kim Chi").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/d/d8/KimS8.jpg/revision/latest?cb=20160202233309")
Dragqueen.find_by(name: "Naomi Smalls").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/2/29/NaomiSmallsAS4.jpg/revision/latest/scale-to-width-down/666?cb=20190207032402")
Dragqueen.find_by(name: "Chi Chi DeVayne").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/e/ef/ChiChiAS3.jpg/revision/latest/scale-to-width-down/666?cb=20171021011155")
Dragqueen.find_by(name: "Derrick Barry").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/a/ac/DerrickS8.jpg/revision/latest?cb=20160202034245")
Dragqueen.find_by(name: "Thorgy Thor").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/d/d4/ThorgyAS3.jpg/revision/latest/scale-to-width-down/666?cb=20171021010757")
Dragqueen.find_by(name: "Robbie Turner").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/9/9d/RobbieS8.jpg/revision/latest?cb=20160202233003")
Dragqueen.find_by(name: "Acid Betty").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/3/3e/AcidS8.jpg/revision/latest?cb=20160203000902")
Dragqueen.find_by(name: "Naysha Lopez").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/2/23/NayshaS8.jpg/revision/latest?cb=20160203000147")
Dragqueen.find_by(name: "Cynthia Lee Fontaine").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/3/34/CynthiaS9.jpg/revision/latest?cb=20170405002828")
Dragqueen.find_by(name: "Dax ExclamationPoint").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/e/e2/DaxS8.jpg/revision/latest?cb=20160202235811")
Dragqueen.find_by(name: "Laila McQueen").update(:image => "https://vignette.wikia.nocookie.net/logosrupaulsdragrace/images/b/bb/LailaS8.jpg/revision/latest?cb=20160202232415")

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
    new_place = "eighth"
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

#FAKE USERS
# User.destroy_all
# peyton = User.create(name: "Peyton Doyle")

##FAKE RATINGS
# Rating.destroy_all
# rating1 = Rating.create(rating: 4, user_id: 5, dragqueen_id: 6723)
# rating1 = Rating.create(rating: 3, user_id: 6, dragqueen_id: 6723)
# rating1 = Rating.create(rating: 1, user_id: 7, dragqueen_id: 6723)
# rating1 = Rating.create(rating: 5, user_id: 8, dragqueen_id: 6723)
# rating1 = Rating.create(rating: 2, user_id: 9, dragqueen_id: 6723)

##FAKE COMMENTS
# Comment.destroy_all
# comment1 = Comment.create(comment: "YO SHE IS THE BEST SEATTLE QUEEN! FIGHT ME!", user_id: peyton.id, dragqueen_id: dela.id)

