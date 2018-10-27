# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Honeystream.Repo.insert!(%Honeystream.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Honeystream.Repo.insert!(%Honeystream.Videos.Video{
  title: "Parov Stelar - Live at Sziget 2018 (Full Show)",
  description: "Marcus Füreder better known by his stage name Parov Stelar, is an Austrian musician, composer, producer and DJ. His musical style is based on a combination of jazz, house, electro and pop. He is known as one of the pioneers of electro swing.",
  content_type: "video/webm",
  filename_high: "parov_high.webm",
  filename_low: "parov_low.webm",
  path_high: "ae02f57f-f05f-403e-a431-f9acf4a27ccd.webm",
  path_low: "7d3670ec-2ece-4e29-853b-27e73ffc0364.webm",
  thumbnail_id: "5203ace1-3d1d-4901-ab1c-e0852f30de64",
  creator_address: "bitcoincash:qp8w68rkl9cj6tpzhwljk58mruy2lwu3lqas5zuu9m",
})
