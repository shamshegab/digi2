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
class Item < ApplicationRecord
end
