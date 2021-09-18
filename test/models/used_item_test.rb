# == Schema Information
#
# Table name: used_items
#
#  id                    :bigint           not null, primary key
#  item_id               :integer
#  charged_price         :integer
#  case_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  price_before_discount :float            default(0.0)
#
require 'test_helper'

class UsedItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
