# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string
#  name                   :string
#  label                  :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  user_role_id           :integer
#  address                :string
#  mobile                 :string
#  birthdate              :date
#  is_active              :boolean          default(TRUE)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum label: [:secertary, :technition, :doctor, :admin, :accounting]
  belongs_to :role, class_name: "UserRole", foreign_key: "user_role_id", optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :technitions, -> { where(label: :technition) } 
  scope :doctors, -> { where(label: :doctor) } 
  scope :admins, -> { where(label: :admin) } 
  scope :secertaries, -> { where(label: :secertaries) } 


  def active_for_authentication?
    super && self.is_active # i.e. super && self.is_active
  end
  
  def inactive_message
    "Sorry, this account has been deactivated."
  end
end
