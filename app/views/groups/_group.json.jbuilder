json.extract! group, :id, :name, :icon, :user_id, :created_at, :updated_at
json.url group_url(group, format: :json)
json.icon url_for(group.icon)
