// https://godbolt.org/z/s9xGde6xP

#include <algorithm>
#include <array>
#include <print>
#include <ranges>

auto distinct_count(auto rng) -> int {
    std::ranges::sort(rng);
    return std::ranges::fold_left_first(
               std::views::adjacent_transform<2>(rng, std::not_equal_to{}),
               std::plus{})
               .value() +
           1;
}

auto main() -> int {
    auto arr = std::array{1, 3, 1, 4, 1, 5};
    std::print("{}", distinct_count(arr)); // outputs 4
}