require "open-uri"

user = User.find_or_create_by!(email: ENV["SEED_USER_EMAIL"]) do |u|
  u.password = ENV["SEED_USER_PASSWORD"]
  u.password_confirmation = ENV["SEED_USER_PASSWORD"]
  u.skip_confirmation!
end

demo_user = User.find_or_create_by!(email: ENV["DEMO_USER_EMAIL"]) do |u|
  u.password = ENV["DEMO_USER_PASSWORD"]
  u.password_confirmation = ENV["DEMO_USER_PASSWORD"]
  u.skip_confirmation!
end

demo_user.confirm unless demo_user.confirmed?
user.confirm unless user.confirmed?

beers_data = [
  # {
  #   name: "Sunset Haze",
  #   description: "A juicy, hazy IPA bursting with tropical fruit aromas and a soft, pillowy mouthfeel.",
  #   beer_type: "brewed",
  #   style: "Hazy IPA",
  #   abv: "6.5%",
  #   rating: 4.5,
  #   favourite: true,
  #   location: "Toronto, ON",
  #   brewing_notes: "Dry hopped with Citra and Mosaic. Fermented at 19C for 7 days.",
  #   date_brewed: Date.new(2024, 11, 10),
  #   image_url: "https://images.pexels.com/photos/1552630/pexels-photo-1552630.jpeg"
  # },
  # {
  #   name: "Midnight Stout",
  #   description: "A rich, roasty stout with notes of dark chocolate, espresso, and a hint of vanilla.",
  #   beer_type: "brewed",
  #   style: "Imperial Stout",
  #   abv: "9.2%",
  #   rating: 4.8,
  #   favourite: true,
  #   location: "Toronto, ON",
  #   brewing_notes: "Aged on toasted oak chips for 2 weeks. Used Maris Otter malt base.",
  #   date_brewed: Date.new(2024, 10, 3),
  #   image_url: "https://images.pexels.com/photos/1269043/pexels-photo-1269043.jpeg"
  # },
  # {
  #   name: "Collective Arts Rhyme & Reason",
  #   description: "A crisp, well-balanced extra pale ale with floral and citrus hop notes.",
  #   beer_type: "tasted",
  #   style: "Extra Pale Ale",
  #   abv: "5.0%",
  #   rating: 3.9,
  #   favourite: false,
  #   location: "Hamilton, ON",
  #   tasting_notes: "Light and refreshing. Good for a patio beer. Slight grapefruit finish.",
  #   date_tasted: Date.new(2025, 1, 15),
  #   image_url: "https://images.unsplash.com/photo-1535958636474-b021ee887b13?w=800"
  # },
  # {
  #   name: "Brickworks Batch 1000",
  #   description: "A classic amber ale with a malty backbone and subtle caramel sweetness.",
  #   beer_type: "tasted",
  #   style: "Amber Ale",
  #   abv: "5.3%",
  #   rating: 3.5,
  #   favourite: false,
  #   location: "Toronto, ON",
  #   tasting_notes: "Solid everyday beer. Not too hoppy, slightly sweet malt finish.",
  #   date_tasted: Date.new(2025, 2, 20),
  #   image_url: "https://images.unsplash.com/photo-1608270586620-248524c67de9?w=800"
  # },
  # {
  #   name: "Golden Wheat",
  #   description: "A light and refreshing German-style wheat beer with banana and clove esters.",
  #   beer_type: "brewed",
  #   style: "Hefeweizen",
  #   abv: "4.8%",
  #   rating: 4.1,
  #   favourite: false,
  #   location: "Toronto, ON",
  #   brewing_notes: "Used WB-06 yeast. Mash temp 65C. Bottle conditioned for 2 weeks.",
  #   date_brewed: Date.new(2025, 1, 28),
  #   image_url: "https://images.unsplash.com/photo-1571613316887-6f8d5cbf7ef7?w=800"
  # }
  {
    name: "Oktoberfest",
    description: "A light and refreshing German-style lager with a malty backbone and a hint of sweetness.",
    beer_type: "brewed",
    style: "Vienna Lager",
    abv: "5.6%",
    rating: 4,
    favourite: true,
    location: "Toronto, ON",
    brewing_notes: "Used Maris Otter malt base.",
    date_brewed: Date.new(2025, 3, 21),
    image_url: "https://hbqlsrninemvefrrnwjt.supabase.co/storage/v1/object/public/beer-app-photos/0savztv60k7cstyvy8q5c83yyyrn"
  },
  {
    name: "Irish Extra Stout",
    description: "A rich, roasty stout with notes of dark chocolate, espresso, and a hint of vanilla.",
    beer_type: "brewed",
    style: "Extra Stout",
    abv: "6.4%",
    rating: 4,
    favourite: true,
    location: "Toronto, ON",
    brewing_notes: "Used Maris Otter malt base.",
    date_brewed: Date.new(2024, 3, 13),
    image_url: "https://hbqlsrninemvefrrnwjt.supabase.co/storage/v1/object/public/beer-app-photos/g6528qftxvf7v1zxb2kj1buau9wk"
  },
  {
    name: "Schnider Weisse Aventinus",
    description: "A light and refreshing German-style wheat beer with banana and clove esters.",
    beer_type: "tasted",
    style: "Weizen-Doppelbock",
    abv: "8.2%",
    rating: 5,
    favourite: true,
    location: "Toronto, ON",
    tasting_notes: "One of the best wheat beers I've had. So many banana and clove esters. Highly recommended.",
    date_tasted: Date.new(2026, 3, 12),
    image_url: "https://hbqlsrninemvefrrnwjt.supabase.co/storage/v1/object/public/beer-app-photos/vrg2p841ra5knh5orzwg6onvbscp"
  },
  {
    name: "My First IPA",
    description: "A juicy, hazy IPA bursting with tropical fruit aromas and a soft, pillowy mouthfeel.",
    beer_type: "brewed",
    style: "NEIPA",
    abv: "5%",
    rating: 3.8,
    favourite: true,
    location: "Toronto, ON",
    brewing_notes: "First dry hop with Citra and Amarillo. Second dry hop with Citra and Galaxy 4 days later. Fermented at 21C",
    date_brewed: Date.new(2022, 10, 19),
    image_url: "https://hbqlsrninemvefrrnwjt.supabase.co/storage/v1/object/public/beer-app-photos/eq9idnolmbe5sd74lyvs8at2do4r"
  },
  {
    name: "SPBW SMüV",
    description: "A Golden Sour Beer Aged in Oak Barrels Packaged with pureed mango, pineapple and passionfruit.",
    beer_type: "tasted",
    style: "Golden Sour",
    abv: "5%",
    rating: 4.8,
    favourite: true,
    location: "Toronto, ON",
    tasting_notes: "Smoothie beer - really good",
    date_brewed: Date.new(2022, 10, 19),
    image_url: "https://hbqlsrninemvefrrnwjt.supabase.co/storage/v1/object/public/beer-app-photos/ylov7j2wpv34bh2b0oi15qk580sf"
  },
  {
    name: "Cream Ale",
    description: "A light and refreshing cream ale with a hint of sweet corniness",
    beer_type: "brewed",
    style: "Cream Ale",
    abv: "5.6%",
    rating: 4.5,
    favourite: true,
    location: "Toronto, ON",
    brewing_notes: "Light and refreshing cream ale. Very good. ",
    date_tasted: Date.new(2023, 4, 1),
    image_url: "https://hbqlsrninemvefrrnwjt.supabase.co/storage/v1/object/public/beer-app-photos/49rzewn80xt0sj4b4njsl2l3fohz"
  },
]

beers_data.each do |data|
  image_url = data.delete(:image_url)
  beer = Beer.create!(data.merge(user: user))
  beer.image.attach(
    io: URI.open(image_url),
    filename: "#{beer.name.parameterize}.jpg",
    content_type: "image/jpeg"
  )
  puts "Created: #{beer.name}"
end
