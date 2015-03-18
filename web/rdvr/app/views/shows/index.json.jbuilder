json.array!(@shows) do |show|
  json.extract! show, :id, :title, :artist, :description, :genre, :weekly, :start, :duration, :host, :port, :url
  json.url show_url(show, format: :json)
end
