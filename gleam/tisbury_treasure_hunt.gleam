import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  list.length(list.filter(treasures, fn(x) { treasure_location_matches_place_location(place.1, x.1) }))
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let found_name = found_treasure.0
  let place_name = place.0
  let desired_name = desired_treasure.0

  case #(found_name, place_name, desired_name) {
    #( "Brass Spyglass", "Abandoned Lighthouse", _ ) ->
      True

    #( "Amethyst Octopus", "Stormy Breakwater", "Crystal Crab" )
    | #( "Amethyst Octopus", "Stormy Breakwater", "Glass Starfish" ) ->
      True

    #( "Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle" )
    | #( "Vintage Pirate Hat", "Harbor Managers Office", "Antique Glass Fishnet Float" ) ->
      True

    _ ->
      False
  }
}
