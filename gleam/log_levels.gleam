import gleam/string.{crop, drop_start, first, trim}
import gleam/result.{unwrap}

pub fn message(log_line: String) -> String {
  trim(drop_start(from: crop(from: log_line, before: " "), up_to: 1))
}

pub fn log_level(log_line: String) -> String {
  let dropped = drop_start(from: log_line, up_to: 1)
  let first = unwrap(first(dropped), or: "n")
  case first {
    first if first == "E" -> "error"
    first if first == "I" -> "info"
    first if first == "W" -> "warning"
    _ -> "not found"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
