namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Mp3.create!(:title => "Example User",
                 :artist => "example@railstutorial.org",
                 :url => "foobar",
                 :length => "110")
    20.times do |n|
      title  = Faker::Lorem.words
      artist = Faker::Name.name
      url  = Faker::Internet.domain_name
      length  = rand(120)
      User.create!(:title => title,
                   :artist => artist,
                   :url => url,
                   :length => length)
                   
      User.all(:limit => 6).each do |user|
        10.times do
            mp3.ratings.create!(:value => rand(5))
        end
      end
    end
  end
end