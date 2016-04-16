[Offer, Request, User, DeliveryMethod, Location].each(&:delete_all)

saigon = Location.create(:name => 'Ho Chi Minh')
sing = Location.create(:name => 'Singapore')
tokyo = Location.create(:name => 'Tokyo')
toronto = Location.create(:name => 'Toronto')
melbourne = Location.create(:name => 'Melbourne')

home = DeliveryMethod.create(:name => 'To this address', :description => 'Deliver to the provided address')
whitehouse = DeliveryMethod.create(:name => 'Self pickup', :description => 'Deliver to the White House')

user1 = User.create(:email => 'user1@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg')
user2 = User.create(:email => 'user2@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg')
user3 = User.create(:email => 'user3@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg')
user4 = User.create(:email => 'user4@example.com', :password => 'password', :password_confirmation => 'password', :avatar => 'https://d8hh9kinq36uh.cloudfront.net/profile/2016-03-25_26717.873446329.jpg')

Request.create(
    requester_id: user1.id,
    name: 'Green bean matcha',
    selling_location_id: tokyo.id,
    delivery_location_id: saigon.id,
    description: 'Feed me this shit',
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2015-08-24_51222.6184997519.jpg',
    quantity: 10,
    offer_price: 10000
)
Request.create(
    requester: user1,
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
    requester: user1,
    name: 'Black bean matcha',
    selling_location_id: tokyo.id,
    delivery_location_id: saigon.id,
    description: 'Feed me this shit',
    delivery_method_id: home.id,
    picture_url: 'https://d8hh9kinq36uh.cloudfront.net/2016-01-14_61871.2960236356.jpg',
    quantity: 10,
    offer_price: 30000
)