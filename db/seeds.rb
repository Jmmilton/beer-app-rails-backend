# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.create!([
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
    tasting_notes: nil,
    date_brewed: Date.new(2024, 11, 10),
    date_tasted: nil,
    beer_image: "https://images.pexels.com/photos/1552630/pexels-photo-1552630.jpeg"
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
    tasting_notes: nil,
    date_brewed: Date.new(2024, 10, 3),
    date_tasted: nil,
    beer_image: "https://images.pexels.com/photos/1269043/pexels-photo-1269043.jpeg"
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
    brewing_notes: nil,
    tasting_notes: "Light and refreshing. Good for a patio beer. Slight grapefruit finish.",
    date_brewed: nil,
    date_tasted: Date.new(2025, 1, 15),
    beer_image: "https://images.pexels.com/photos/3566218/pexels-photo-3566218.jpeg"
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
    brewing_notes: nil,
    tasting_notes: "Solid everyday beer. Not too hoppy, slightly sweet malt finish.",
    date_brewed: nil,
    date_tasted: Date.new(2025, 2, 20),
    beer_image: "https://images.pexels.com/photos/5947019/pexels-photo-5947019.jpeg"
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
    tasting_notes: nil,
    date_brewed: Date.new(2025, 1, 28),
    date_tasted: nil,
    beer_image: "https://images.pexels.com/photos/4194860/pexels-photo-4194860.jpeg"
  }
])