puts 'Cleaning database...'
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
    address: "Lake District",
    max_guests: 4,
    user: dima,
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
    user: victor,
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
    user: victor,
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
    user: dima,
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
    user: charles,
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
    user: charles,
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
puts 'Finished!'
