# {
#   "name": "Tommy"
# }
# json.set!(:name, "Tommy")

# json.array! @bleats do |bleat|
#   # json.set!(:id, bleat.id)
#   # json.set!(:body, bleat.body)
#   # json.set!(:author_id, bleat.author_id)
#   # json.id(bleat.id)
#   # json.body bleat.body
#   # json.author_id bleat.author_id
#   # json.extract! bleat, :id, :body, :author_id
#   json.partial! "/api/bleats/bleat", bleat: bleat
#   json.author do
#     json.extract! bleat.author, :id, :email
#   end
# end

json.bleats do
  @bleats.each do |bleat|
    json.set! bleat.id do
      json.partial! "/api/bleats/bleat", bleat: bleat
    end
  end
end

json.users do
  @bleats.map(&:author).each do |user|
    json.set! user.id do
      json.extract! user, :id, :email, :authored_bleat_ids
    end
  end
end

# {
#   bleats: {
#     1: {id: 1, body: "something", author_id: 1},
#     3: {id: 3, body: "something else", author_id: 2}
#   },
#   users: {
#     1: {id: 1, email: "tommy@tommy.com", authored_bleat_ids: [1]},
#     2: {id: 2, email: "mashu@mashu.com", authored_bleat_ids: [2]}
#   }
# }