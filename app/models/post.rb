class Post < ActiveRecord::Base
  acts_as_votable


# ILIKE works for postgres in production, LIKE for development
  def self.search(search)
   where("company ILIKE ?", "%#{search}%")
 end

 def to_param
   "#{id} #{company}".parameterize
 end


 scope :facebook, -> { where(:category => 'Facebook Ad')}




end
