json.array!(@projects) do |project|
  json.extract! project, :id, :title, :budget, :published, :closed, :target_date, :category, :description
  json.url project_url(project, format: :json)
end
