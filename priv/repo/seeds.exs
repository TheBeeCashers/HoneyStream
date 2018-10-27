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
Honeystream.Repo.insert!(%Honeystream.Videos.Video{
  title: "Parov Stelar - Step Two ft. Lilja Bloom (Official Video)",
  description: "Taken from the new Parov Stelar album “The Burning Spider”
  <br><a href=\"http://parovstelar.com\">http://parovstelar.com</a>
  <br><a href=\"https://www.facebook.com/parovstelar\">https://www.facebook.com/parovstelar</a>
  <br><a href=\"https://www.instagram.com/parovstelarofficial\">https://www.instagram.com/parovstelarofficial</a>
  <br><br>Featuring:
<br><a href=\"http://www.liljabloom.com/\">http://www.liljabloom.com</a>
<br><a href=\"https://www.facebook.com/liljabloom\">https://www.facebook.com/liljabloom</a>",
  content_type: "video/webm",
  filename_high: "steptwo_high.webm",
  filename_low: "steptwo_low.webm",
  path_high: "92200b7d-3218-45cd-adc1-c28becc4fc90.webm",
  path_low: "3a9a83f3-1a04-4528-9e15-d62ab28f220c.webm",
  thumbnail_id: "fe78510d-d2c4-41b9-a7cb-735fb487e7ba",
  creator_address: "bitcoincash:qp8w68rkl9cj6tpzhwljk58mruy2lwu3lqas5zuu9m",
})
Honeystream.Repo.insert!(%Honeystream.Videos.Video{
  title: "Parov Stelar - Mambo Rap (Official Video)",
  description: "Available for Download/Stream here: <a href=\"https://parovstelar.lnk.to/MamboRap\">https://parovstelar.lnk.to/MamboRap</a>
  <br><br>Dancer: Fik-Shun Stegall
  <br>So You Think You Can Dance
  <br>Season 10 Male Winner
  <br><a href=\"http://parovstelar.com\">http://parovstelar.com</a>
  <br><a href=\"https://www.facebook.com/parovstelar\">https://www.facebook.com/parovstelar</a>
  <br><a href=\"https://www.instagram.com/parovstelarofficial\">https://www.instagram.com/parovstelarofficial</a>",
  content_type: "video/webm",
  filename_high: "parov_high.webm",
  filename_low: "parov_low.webm",
  path_high: "d6c7f5f9-d156-4d46-a543-d65c0623252e.webm",
  path_low: "04072882-9bdf-4de8-bd3f-2ee547474618.webm",
  thumbnail_id: "d89a2cb9-b032-4614-ac7f-a7490e119836",
  creator_address: "bitcoincash:qp8w68rkl9cj6tpzhwljk58mruy2lwu3lqas5zuu9m",
})
