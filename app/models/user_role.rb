# == Schema Information
#
# Table name: user_roles
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserRole < ApplicationRecord
    has_many :users, class_name: "User", foreign_key: "user_role_id", dependent: :restrict_with_error
end
