json.array!(@userfids) do |userfid|
  json.extract! userfid, :id, :name, :slug
  json.url userfid_url(userfid, format: :json)
end
