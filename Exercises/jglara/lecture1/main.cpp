#include <iostream>
#include <algorithm>
#include <ranges>


namespace vws = std::views;
namespace rngs = std::ranges;

// Assuming rng is sorted, count unique elements in a range
unsigned int count_unique(auto &&rng)
{

    return rngs::fold_left(
                rng | vws::adjacent_transform<2>(std::not_equal_to{})
                1, std::plus{}
            );       
}

int main()
{
    auto arr = std::array{1, 3, 1, 4, 1, 5};
    rngs::sort(arr);
    std::cout << "Count: " << count_unique(arr) << std::endl;

    return 0;
}
