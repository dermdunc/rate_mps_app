# == Schema Information
#
# Table name: mp3s
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  title      :string(255)
#  artist     :string(255)
#  length     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Mp3 < ActiveRecord::Base
  attr_accessible :url, :title, :artist, :length
  
  validates :title, :presence => true,
                    :length => { :maximum => 50 }
  validates :artist, :presence => true,
                     :length => { :maximum => 50 }  
  validates :url, :length => { :maximum => 50 }
  
  validates_uniqueness_of :title, :scope => :artist                                      
end
