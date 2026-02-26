json.extract! activity, :id, :title, :description, :duration_minutes, :created_at, :updated_at
json.url activity_url(activity, format: :json)
