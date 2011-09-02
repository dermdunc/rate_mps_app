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

#For your question, one could actually do:
#@users.collect(&:score).sum.to_f/@users.length if @users.length > 0
#Earlier I thought, @users.collect(&:score).average would have worked. 
#For database fields, User.average(:score) will work. 
#You can also add :conditions like other activerecord queries.

#Person.average(:age, :conditions => ['age >= ?', 55])

class Mp3 < ActiveRecord::Base
  before_save :recalculate_fields
  attr_accessible :url, :title, :artist, :length
  
  has_many :ratings, :dependent => :destroy
  
  validates :title, :presence => true,
                    :length => { :maximum => 50 }
  validates :artist, :length => { :maximum => 50 }  
  validates :url, :length => { :maximum => 50 }
  validates_numericality_of :length, :only_integer => true, :message => "can only be whole number."
  
  validates_uniqueness_of :title, :scope => :artist 
  
  def recalculate_fields
      # Set rating to average of related ratings
      self.rating = Rating.average(:value, :conditions => ['mp3_id >= ?', self.id]).to_i
  end 
  
  def self.average_rating
    ratings.map(&:value).average
  end                                    
end
