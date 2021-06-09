class Room < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true

  def self.search(keyword)
    where(["title like? OR name like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
