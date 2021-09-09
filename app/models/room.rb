class Room < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true
  validates :semester, presence: true
  validates :department, presence: true


  # def self.search(keyword)
  #   where(["title like? OR name like? OR semester like?  OR department like? ", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  # end 
  
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .title_like(search_params[:title])
      .semester_is(search_params[:semester])
      .department_is(search_params[:department])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
  scope :semester_is, -> (semester) { where(semester: semester) if semester.present? }
  scope :department_is, -> (department) { where(department: department) if department.present? }
end
