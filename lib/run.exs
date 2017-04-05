"This is awesome" |> String.split |> Enum.into!(File.stream! "/tmp/gu")
