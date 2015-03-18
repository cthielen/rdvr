json.array!(@recordings) do |recording|
  json.extract! recording, :id, :show_id, :filename, :title, :started, :finished
  json.url recording_url(recording, format: :json)
end
