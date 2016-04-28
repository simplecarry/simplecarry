[Notification, Comment, Offer, Request, User, DeliveryMethod, Location].each(&:delete_all)

saigon = Location.create(:name => 'Ho Chi Minh', picture_url:"https://d8hh9kinq36uh.cloudfront.net/Vietnam@2x.jpg")
sing = Location.create(:name => 'Singapore', picture_url:"https://d8hh9kinq36uh.cloudfront.net/Singapore@2x.jpg")
tokyo = Location.create(:name => 'Tokyo',picture_url:"https://d8hh9kinq36uh.cloudfront.net/Japan@2x.jpg")
newyork = Location.create(:name => 'New York', picture_url:"https://d8hh9kinq36uh.cloudfront.net/United%20States@2x.jpg")
melbourne = Location.create(:name => 'Melbourne', picture_url:"https://d8hh9kinq36uh.cloudfront.net/Austria@2x.jpg")
hongkong = Location.create(:name => 'Hong Kong', picture_url:"https://d8hh9kinq36uh.cloudfront.net/Hong%20Kong@2x.jpg")

home = DeliveryMethod.create(:name => 'To this address', :description => 'Deliver to the provided address')
whitehouse = DeliveryMethod.create(:name => 'Self pickup', :description => 'Deliver to the White House')

user1 = User.create(:email => 'user1@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg', :current_score => 3)
user2 = User.create(:email => 'user2@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2015-12-30_66956.3893574573.jpg', :current_score => 5)
user3 = User.create(:email => 'user3@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2015-11-11_91776.1887294492.jpg', :current_score => 4)
user4 = User.create(:email => 'user4@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2015-10-08_97636.1269635932.jpg', :current_score => 1)

Request.create(
    requester_id: user1.id,
    name: "Green bean matcha",
    selling_location_id: tokyo.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2015-08-24_51222.6184997519.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user2,
    name: "Red bean matcha",
    selling_location_id: tokyo.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: whitehouse.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-03-23_92864.7570336483.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user3,
    name: "Stone Enjoy By 05.30.16 Tangerine IPA",
    selling_location_id: newyork.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-04-27_97964.5172418102.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user1,
    name: "Nest thermostat",
    selling_location_id: newyork.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-04-27_12575327405190.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user2,
    name: "Oreo Mini Reese's Peanut Butter",
    selling_location_id: hongkong.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-04-27_96398887618255.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user3,
    name: "Black bean matcha",
    selling_location_id: sing.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-01-14_61871.2960236356.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user1,
    name: "Adidas ultra boost",
    selling_location_id: hongkong.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-04-27_71978.524232138.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user2,
    name: "Coach Swagger 27 Carryall in Pebble Leather",
    selling_location_id: newyork.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-04-28_62614.436681838.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
Request.create(
    requester: user4,
    name: "NARS lip cover - Members Only",
    selling_location_id: melbourne.id,
    delivery_location_id: saigon.id,
    description: Faker::Hipster.paragraph,
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-04-28_21918.2885761865.jpg',
    quantity: 10,
    offer_price: Faker::Number.number(8)
)
