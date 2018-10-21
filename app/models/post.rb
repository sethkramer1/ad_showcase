class Post < ActiveRecord::Base
  acts_as_votable

  def self.search(search)
   where("company LIKE ?", "%#{search}%")
 end

 def to_param
   "#{id} #{company}".parameterize
 end


 scope :facebook, -> { where(:category => 'Facebook Ad')}




end
