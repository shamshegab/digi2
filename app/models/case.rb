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
class Case < ApplicationRecord
  

    has_many :used_items, class_name: "UsedItem", foreign_key: "case_id"
    belongs_to :owner, class_name: "User", foreign_key: "owner_id"
    belongs_to :referring_doctor, class_name: "ReferringDoctor", foreign_key: "referring_doctor_id", optional: true
    belongs_to :technition, class_name: "User", foreign_key: "technition_id"
    belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"
    belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"

    accepts_nested_attributes_for :used_items
    
    mount_uploader :image, ImageUploader
    def get_referring_doctor
        if self.referring_doctor.present?
            self.referring_doctor
        else
            ""
        end
    end
    
end
