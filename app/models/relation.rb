class Relation < ApplicationRecord
  validates :userid, uniqueness: { scope: :roomid }
end
