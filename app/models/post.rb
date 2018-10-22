class Post < ActiveRecord::Base
  acts_as_votable


# ILIKE works for postgres in production, LIKE for development
  def self.search(search)
   where("company ILIKE ?", "%#{search}%")
 end

 def to_param
   "#{id} #{company}".parameterize
 end


 scope :ecommerce, -> { where(:category => 'E-Commerce')}
 scope :travel, -> { where(:category => 'Travel')}
 scope :realestate, -> { where(:category => 'Real Estate')}
 scope :food, -> { where(:category => 'Food and Beverage')}
 scope :transportation, -> { where(:category => 'Transportation')}
 scope :finance, -> { where(:category => 'Finance')}
 scope :healthcare, -> { where(:category => 'Healthcare')}
 scope :games, -> { where(:category => 'Games')}
 scope :education, -> { where(:category => 'Education')}
 scope :entertainment, -> { where(:category => 'Entertainment')}
 scope :software, -> { where(:category => 'Other Software')}








end
