namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Mp3.create!(:title => "Take It Easy",
                 :artist => "The Eagles",
                 :url => "Eagles URL",
                 :length => "110")
    20.times do |n|
      title  = Faker::Lorem.words
      artist = Faker::Name.name
      url  = Faker::Internet.domain_name
      length  = rand(120)
      Mp3.create!(:title => title,
                   :artist => artist,
                   :url => url,
                   :length => length)
                   
      Mp3.all(:limit => 15).each do |mp3|
        10.times do
            mp3.ratings.create!(:value => (rand(4)+1))
        end
      end
    end
  end
end