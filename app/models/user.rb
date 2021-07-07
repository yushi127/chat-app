class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :authentication_keys => [:login]
      
has_many :messages
def messages
  return Message.where(user_id: self.id)
end

  attr_accessor :login

  def new
    user_id = @User.all
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 3, maximum: 20 }
  # format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}

    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@kwansei.ac.jp\z/i
    # validates :email, {presence: true, format:{ with: VALID_EMAIL_REGEX }}

    
end
