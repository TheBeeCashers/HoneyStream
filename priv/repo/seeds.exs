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
  title: "Parov Stelar @ Sziget 2018",
  content_type: "video/webm",
  filename_high: "parov_high.webm",
  filename_low: "parov_low.webm",
  path_high: "ae02f57f-f05f-403e-a431-f9acf4a27ccd.webm",
  path_low: "7d3670ec-2ece-4e29-853b-27e73ffc0364.webm",
  payments: [
    %Honeystream.Videos.Payment{
      user: "someuseridentifier",
      button_id: "somebuttonid",
    }
  ]
})
payment = %Honeystream.Videos.Payment{
  user: "someuseridentifier",
  button_id: "somebuttonid",
}

#Honeystream.Repo.insert!()
