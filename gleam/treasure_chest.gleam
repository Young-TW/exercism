// Please define the TreasureChest generic custom type
pub type TreasureChest(treasure) {
  TreasureChest(String, treasure)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(value) {
  Unlocked(value)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  let TreasureChest(box_password, treasure) = chest

  case box_password {
    box_password if box_password == password -> Unlocked(treasure)
    _ -> WrongPassword
  }
}
