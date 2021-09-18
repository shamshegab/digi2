# == Schema Information
#
# Table name: referring_doctors
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  address    :text
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  clinic     :string
#  mobile     :string
#  birthdate  :date
#
class ReferringDoctor < ApplicationRecord
    has_many :cases, class_name: "Case", foreign_key: "referring_doctor_id"
end
