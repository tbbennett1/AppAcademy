# {
#   "name": "Tommy"
# }
# json.set!(:name, "Tommy")

json.array! @bleats do |bleat|
  # json.set!(:id, bleat.id)
  # json.set!(:body, bleat.body)
  # json.set!(:author_id, bleat.author_id)
  # json.id(bleat.id)
  # json.body bleat.body
  # json.author_id bleat.author_id
  # json.extract! bleat, :id, :body, :author_id
  json.partial! "/api/bleats/bleat", bleat: bleat
  json.author do
    json.extract! bleat.author, :id, :email
  end
end