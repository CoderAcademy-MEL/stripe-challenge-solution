json.extract! course, :id, :title, :content, :price, :created_at, :updated_at
json.url course_url(course, format: :json)
