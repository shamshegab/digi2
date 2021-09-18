# == Schema Information
#
# Table name: items
#
#  id            :bigint           not null, primary key
#  title         :string
#  default_price :integer
#  available     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
