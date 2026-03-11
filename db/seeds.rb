require "open-uri"

user = User.find_or_create_by!(email: ENV["SEED_USER_EMAIL"]) do |u|
  u.password = ENV["SEED_USER_PASSWORD"]
  u.password_confirmation = ENV["SEED_USER_PASSWORD"]
  u.skip_confirmation!
end

demo_user = User.find_or_create_by!(email: "demo@mybrews.app") do |u|
  u.password = "demo"
  u.password_confirmation = "demo"
  u.skip_confirmation!
end

demo_user.confirm unless demo_user.confirmed?
user.confirm unless user.confirmed?

beers_data = [
  {
    name: "Sunset Haze",
    description: "A juicy, hazy IPA bursting with tropical fruit aromas and a soft, pillowy mouthfeel.",
    beer_type: "brewed",
    style: "Hazy IPA",
    abv: "6.5%",
    rating: 4.5,
    favourite: true,
    location: "Toronto, ON",
    brewing_notes: "Dry hopped with Citra and Mosaic. Fermented at 19C for 7 days.",
    date_brewed: Date.new(2024, 11, 10),
    image_url: "https://images.pexels.com/photos/1552630/pexels-photo-1552630.jpeg"
  },
  {
    name: "Midnight Stout",
    description: "A rich, roasty stout with notes of dark chocolate, espresso, and a hint of vanilla.",
    beer_type: "brewed",
    style: "Imperial Stout",
    abv: "9.2%",
    rating: 4.8,
    favourite: true,
    location: "Toronto, ON",
    brewing_notes: "Aged on toasted oak chips for 2 weeks. Used Maris Otter malt base.",
    date_brewed: Date.new(2024, 10, 3),
    image_url: "https://images.pexels.com/photos/1269043/pexels-photo-1269043.jpeg"
  },
  {
    name: "Collective Arts Rhyme & Reason",
    description: "A crisp, well-balanced extra pale ale with floral and citrus hop notes.",
    beer_type: "tasted",
    style: "Extra Pale Ale",
    abv: "5.0%",
    rating: 3.9,
    favourite: false,
    location: "Hamilton, ON",
    tasting_notes: "Light and refreshing. Good for a patio beer. Slight grapefruit finish.",
    date_tasted: Date.new(2025, 1, 15),
    image_url: "https://images.pexels.com/photos/3566218/pexels-photo-3566218.jpeg"
  },
  {
    name: "Brickworks Batch 1000",
    description: "A classic amber ale with a malty backbone and subtle caramel sweetness.",
    beer_type: "tasted",
    style: "Amber Ale",
    abv: "5.3%",
    rating: 3.5,
    favourite: false,
    location: "Toronto, ON",
    tasting_notes: "Solid everyday beer. Not too hoppy, slightly sweet malt finish.",
    date_tasted: Date.new(2025, 2, 20),
    image_url: "https://images.pexels.com/photos/5947019/pexels-photo-5947019.jpeg"
  },
  {
    name: "Golden Wheat",
    description: "A light and refreshing German-style wheat beer with banana and clove esters.",
    beer_type: "brewed",
    style: "Hefeweizen",
    abv: "4.8%",
    rating: 4.1,
    favourite: false,
    location: "Toronto, ON",
    brewing_notes: "Used WB-06 yeast. Mash temp 65C. Bottle conditioned for 2 weeks.",
    date_brewed: Date.new(2025, 1, 28),
    image_url: "https://images.pexels.com/photos/4194860/pexels-photo-4194860.jpeg"
  }
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
