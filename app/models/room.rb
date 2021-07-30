class Room < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true
  validates :semester, presence: true
  validates :department, presence: true


  def self.search(keyword)
    where(["title like? OR name like? OR semester like?  OR department like? ", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
  
end
