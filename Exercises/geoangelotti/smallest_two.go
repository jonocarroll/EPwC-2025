package epwc

import (
	"math"
	"slices"
	"sort"
)

func SmallestTwoSort(nums []int) []int {
	if len(nums) < 2 {
		panic("Need at least 2 numbers")
	}
	slices.Sort(nums)
	return []int{nums[0], nums[1]}
}

func SmallestTwoSortInts(nums []int) []int {
	if len(nums) < 2 {
		panic("Need at least 2 numbers")
	}
	sort.Ints(nums)
	return []int{nums[0], nums[1]}
}

func SmallestTwo(nums []int) []int {
	if len(nums) < 2 {
		panic("Need at least 2 numbers")
	}
	smallest := math.MaxInt
	secondSmallest := math.MaxInt
	for _, num := range nums {
		if num < smallest {
			secondSmallest = smallest
			smallest = num
		} else if num < secondSmallest && num != smallest {
			secondSmallest = num
		}
	}
	return []int{smallest, secondSmallest}
}
