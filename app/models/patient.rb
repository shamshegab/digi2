# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  mobile     :string
#  name       :string
#  address    :text
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Patient < ApplicationRecord
    has_many :cases, class_name: "Case", foreign_key: "patient_id"
    validates_uniqueness_of :mobile, on: :create, message: "already exists"
end
