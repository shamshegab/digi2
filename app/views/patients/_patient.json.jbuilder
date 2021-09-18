json.extract! patient, :id, :mobile, :name, :address, :email, :created_at, :updated_at
json.url patient_url(patient, format: :json)
