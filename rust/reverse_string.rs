pub fn reverse(input: &str) -> String {
    // Convert the input string to a vector of characters
    let mut chars: Vec<char> = input.chars().collect();

    // Reverse the vector of characters
    chars.reverse();

    // Collect the reversed characters back into a string
    chars.into_iter().collect()
}
