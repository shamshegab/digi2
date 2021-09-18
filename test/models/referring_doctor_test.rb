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
require 'test_helper'

class ReferringDoctorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
