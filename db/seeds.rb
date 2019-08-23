puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all

Campsite.destroy_all
User.destroy_all

puts 'Creating users...'
victor = User.new
victor.first_name = "test"
victor.last_name = "test"
victor.email = 'victor@example.com'
victor.password = "123456"
victor.password_confirmation = "123456"
victor.save!

charles = User.new
charles.email = 'charles@example.com'
charles.first_name = "test"
charles.last_name = "test"
charles.password = "123456"
charles.password_confirmation = "123456"
charles.save!

dima = User.new
dima.email = 'dima@example.com'
dima.first_name = "test"
dima.last_name = "test"
dima.password = "123456"
dima.password_confirmation = "123456"
dima.save!

landlord = User.new
landlord.email = 'landlord@example.com'
landlord.first_name = "test"
landlord.last_name = "test"
landlord.password = "123456"
landlord.password_confirmation = "123456"
landlord.save!

puts 'Finished!'
puts 'Creating campsites...'
campsites_attributes = [
  {
    title: "Caolasnacon Caravan & Camping Park",
    description: "Hosted by Jennifer N. Come enjoy a quiet, peaceful getaway where you can fish, bird, watch, tree climb, hike and observe the natural habitat of the wildlife around you.  You can cook on an open fire, roast marshmallows and stare at the thousands of brights stars unseen in city areas!  Close by you can go fossil hunting, hiking and exploring!",
    price_per_night: 30,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 1,
    address: "PH50 4RJ",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "Blackwater Hostel, Glamping & Campsite",
    description: "Pitch your tent anywhere on our 20+ acres of Rocky Paradise nestled on the foothills of Blanca Peak at 8250ft. Expect to hear coyotes howling most every evening and morning. Enjoy breathtaking sunrises and sunsets and unobstructed views of Mt. Blanca and millions of stars. AWD or 4WD is recommended and please be mindful of Valley weather and wind and wildlife. ",
    price_per_night: 20,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 2,
    address: "PH50 4SG",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "Invercoe caravan & camping park",
    description: "Large modern caravan holiday homes by the lochside, with their own deck areas. With two of our caravans available  to take your dog with you on your holiday. Please call 01855811210 for more information.",
    price_per_night: 50,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 2,
    address: "PH49 4HP",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "4 Winds Lakeland Tipis",
    description: "Onsite you can gaze at the Sun rising over Lake Windermere and take pleasure in the magnificent fell views. Our Campsite is situated in the heart of The Lake District, it is a great base for off-road biking tracks, launching non-powered water crafts, or a starting point for gentle walks or more adventurous hikes. Leave the car behind and explore the area on foot, by bike or by boat. You can also enjoy fishing and bird watching all from the campsite grounds.",
    price_per_night: 30,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 2,
    address:"LA22 0JA",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "Low Wray Campsite",
    description: "ow Wray Campsite occupies one of the finest locations in the Lake District, with access to the shores of Lake Windermere and Wray Castle. This stunning site offers a wide-range of camping options including traditional pitches with waterfront, lake, meadow or woodland views, or camping pods, safari tents and space for campervans. ",
    price_per_night: 10,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 2,
    address:"LA22 0JA",
    max_guests: 3,
    user: landlord,
  },
  {
    title: "BaysBrown Farm Campsite",
    description: "Baysbrown Farm Campsite is located about 7 miles from Ambleside in the village of Chapel Stile at the entrance to the stunning Great Langdale Valley at the heart of the Lake District. We are a working Lakeland farm with an area set aside for camping. We don't have set pitches, just space. You pitch where you like and can park next to your tent, though this is sometimes not possible in adverse weather conditions.",
    price_per_night: 15,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 2,
    address: "LA22 9JZ",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "Sharamore House",
    description: "Louis and Terry are happy to host you on their property. A minute's walk from the coastline, this secluded B&B sits 3.5 km from the beaches and hiking trails of Clifden, and 10 km from Connemara National Park.",
    price_per_night: 20,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 1,
    address: "Sky Road, Clifden, County Galway, Ireland",
    max_guests: 6,
    user: landlord,
  },
  {
    title: "Large field with view on the bay",
    description: "Mike is pleased to host you on this unique location. Camping location is facing the bay, offering an stocishing view on the sea. Outside of all cities, enjoy the stars during the night (if the weather allows it). The owner offers souvenirs and extra amenities (garbage disposal, wifi)",
    price_per_night: 10,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 1,
    address: "Claddaghduff, County Galway, Ireland",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "Pasture with exceptional view",
    description: "Campster exclusive location with view on Ballynakill Lough lake. Daire the owner is happy to invite to rest in this ancient pasture. He also offer to rest in an ancient barn in case of really bad weather. Located at 15km from Clegan, this location is perfect for trekkers travelling along the coast.",
    price_per_night: 20,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 1,
    address: "Moyard, Ballynakill, County Galway, Ireland",
    max_guests: 4,
    user: landlord,
  },
  {
    title: "Kathleen's lodge - Great sea view",
    description: "Campster Exclusive - Amazing land next to a lake. Kathleen's, her husband and their 2 dogs will welcome you on their private lands located next to a lake. In addition, Kathleen can provide trekk lunch for an additional price, as well as toilets and garbage disposal amenities. Perfect for trekkers walking along the Forester Coast road.",
    price_per_night: 10,
    check_in: "5 PM",
    check_out: "10 AM",
    min_nights: 1,
    address: "Dawros More, Co. Galway, Ireland",
    max_guests: 4,
    user: landlord,
  }
]
Campsite.create!(campsites_attributes)
puts 'Went fishing...'
puts 'Uploading pictures...'
campsite = Campsite.first
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566386583/camping-6_vlkcmu.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.second
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566386583/camping-4_cid7ko.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.third
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566386582/camping-3_wgqqdt.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.fourth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566386582/camping-2_ar8nid.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.fifth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566386582/camping-1_yotp8u.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.offset(1).fifth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566386583/camping-5_jbqt6z.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.offset(2).fifth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566563636/camping-7.png"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.offset(3).fifth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566564938/camping-8.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.offset(4).fifth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566565833/camping-9.jpg"
campsite.remote_photo_url = url
campsite.save
campsite = Campsite.offset(5).fifth
url = "https://res.cloudinary.com/dqh0reqn3/image/upload/v1566565833/camping-10.jpg"
campsite.remote_photo_url = url
campsite.save
puts 'Finished!'
