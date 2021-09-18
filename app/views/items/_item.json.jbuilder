json.extract! item, :id, :title, :default_price, :available, :created_at, :updated_at
json.url item_url(item, format: :json)
