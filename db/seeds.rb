[Comment, Offer, Request, User, DeliveryMethod, Location].each(&:delete_all)

saigon = Location.create(:name => 'Ho Chi Minh', picture_url:"http://4.bp.blogspot.com/-Mgl1mtLgPxc/UWVsHyG_GUI/AAAAAAAAEjE/sY6I4hOIVHU/s640/8578367947_f413292328_o.jpg")
sing = Location.create(:name => 'Singapore', picture_url:"https://d8hh9kinq36uh.cloudfront.net/Singapore@2x.jpg")
tokyo = Location.create(:name => 'Tokyo',picture_url:"https://d8hh9kinq36uh.cloudfront.net/Japan@2x.jpg")
toronto = Location.create(:name => 'Toronto', picture_url:"https://d8hh9kinq36uh.cloudfront.net/United%20States@2x.jpg")
melbourne = Location.create(:name => 'Melbourne', picture_url:"https://d8hh9kinq36uh.cloudfront.net/Austria@2x.jpg")

home = DeliveryMethod.create(:name => 'To this address', :description => 'Deliver to the provided address')
whitehouse = DeliveryMethod.create(:name => 'Self pickup', :description => 'Deliver to the White House')

user1 = User.create(:email => 'user1@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg', :current_score => 3)
user2 = User.create(:email => 'user2@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg', :current_score => 5)
user3 = User.create(:email => 'user3@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg', :current_score => 4)
user4 = User.create(:email => 'user4@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg', :current_score => 1)

Request.create(
    requester_id: user1.id,
    name: 'Green bean matcha',
    selling_location_id: tokyo.id,
    delivery_location_id: saigon.id,
    description: 'Feed me this shit gay la',
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2015-08-24_51222.6184997519.jpg',
    quantity: 10,
    offer_price: 10000
)
Request.create(
    requester: user2,
    name: 'Red bean matcha',
    selling_location_id: tokyo.id,
    delivery_location_id: saigon.id,
    description: 'Feed me this shit',
    delivery_method_id: whitehouse.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-03-23_92864.7570336483.jpg',
    quantity: 10,
    offer_price: 20000
)
Request.create(
    requester: user3,
    name: 'Black bean matcha',
    selling_location_id: toronto.id,
    delivery_location_id: saigon.id,
    description: 'Gay lord come form gay ',
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-01-14_61871.2960236356.jpg',
    quantity: 10,
    offer_price: 30000
)
