json.extract! todo, :id, :title, :body, :done, :created_at, :updated_at
json.url todo_url(todo, format: :json)
