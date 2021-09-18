# == Schema Information
#
# Table name: cases
#
#  id                  :bigint           not null, primary key
#  note                :text
#  owner_id            :integer
#  patient_id          :integer
#  referring_doctor_id :integer
#  technition_id       :integer
#  doctor_id           :integer
#  ended               :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  contacted           :datetime
#  reported            :datetime
#  image               :text
#  discount            :float            default(0.0)
#
require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
