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
class UsedItem < ApplicationRecord
    belongs_to :case, class_name: "Case", foreign_key: "case_id"
    belongs_to :item, class_name: "Item", foreign_key: "item_id"
end
