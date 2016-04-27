class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :recoverable, :trackable,
    :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User
  belongs_to :team

  def password_required?
    super if confirmed?
  end

  def team_number
    team.number
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end
