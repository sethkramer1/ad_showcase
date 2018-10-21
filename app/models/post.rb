class Post < ActiveRecord::Base
  acts_as_votable

  def self.search(search)
   where("company LIKE ?", "%#{search}%")
 end


 scope :facebook, -> { where(:category => 'Facebook Ad')}


end
