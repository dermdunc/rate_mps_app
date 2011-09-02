class Rating < ActiveRecord::Base
  attr_accessible :value
  
  belongs_to :mp3
  
  validates :value, :presence => true
  #validates_numericality_of :value, :only_integer => true, :message => "can only be whole number."
  validates_inclusion_of :value, :in => 1..5, :message => "can only be between 1 and 5."
  
  validates :mp3_id, :presence => true
end
