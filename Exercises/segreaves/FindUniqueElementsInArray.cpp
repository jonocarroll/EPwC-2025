#include <iostream>
#include <chrono>
#include <set>
#include <algorithm>
#include <functional>
#include <array>
#include <ranges>

// From Alexander Stepanov's lectures on Efficient Programming With Components
// https://www.youtube.com/watch?v=aIHAEYyoTUc&list=PLHxtyCq_WDLXryyw91lahwdtpZsmo4BGD&index=1
// Find the unique elements in { 1, 3, 1, 4, 1, 5 }

int findUnique_Set(int arr[], int size)
{
    std::set<int> uniq{ arr, arr + size };
    return uniq.size();
}

int findUnique_Ptr(int arr[], int size)
{
    std::sort(arr, arr + size);
    return std::unique(arr, arr + size) - arr;
}

int findUnique_TwoPtr(int arr[], int size)
{
    std::sort(arr, arr + size);
    int count{ 0 };
    for (int i = 0; i < size; ++i)
        if (i == 0 || arr[i] != arr[i - 1]) ++count;
    return count;
}

void findUnique(int arr[], int size, std::function<int(int[], int)> func)
{
    int reps{ 1000000 };
    int i{ 0 };
    int ans;

    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();
    while (i++ < reps) ans = func(arr, size);
    std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;
    std::cout << "Elapsed time: " << elapsed.count() << " seconds" << std::endl;
}

int main()
{
    int arr[] = { 1, 3, 1, 4, 1, 5 };
    int size{ sizeof(arr) / sizeof(arr[0]) };

    std::cout << "---------------------";
    std::cout << std::endl << "Using findUnique_Set: " << std::endl;
    findUnique(arr, size, findUnique_Set);

    std::cout << std::endl << "Using findUnique_Ptr: " << std::endl;
    findUnique(arr, size, findUnique_Ptr);
    
    std::cout <<  std::endl << "Using findUnique_TwoPtr: " << std::endl;
    findUnique(arr, size, findUnique_TwoPtr);
}
