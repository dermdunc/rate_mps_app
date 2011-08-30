# By using the symbol ':mp3', we get Factory Girl to simulate the MP3 model.
Factory.define :mp3 do |mp3|
  mp3.title         "Hotel California"
  mp3.artist        "The Eagles"
  mp3.url           "..."
  mp3.length        170
end