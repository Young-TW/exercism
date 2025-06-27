#include <string>

namespace log_line {
std::string message(std::string line) {
    // return the message
    return line.substr(line.find(":") + 2, line.length());;
}

std::string log_level(std::string line) {
    // return the log level
    return line.substr(1, line.find("]") - 1);
}

std::string reformat(std::string line) {
    // return the reformatted message
    std::string origin_line = line;
    line = line.substr(line.find(":") + 2, line.length());
    line.append(" (").append(log_level(origin_line)).append(")");
    return line;
}
}  // namespace log_line
