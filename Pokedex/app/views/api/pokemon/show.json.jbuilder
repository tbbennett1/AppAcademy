json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids
  begin
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
  rescue
    json.image_url @pokemon.image_url
  end
end
