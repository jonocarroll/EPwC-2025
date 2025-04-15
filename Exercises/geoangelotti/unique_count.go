package epwc

import (
	"slices"
	"sort"
)

func UniqueCount1(data []int) int {
	sort.Slice(data, func(i, j int) bool {
		return data[i] < data[j]
	})
	if len(data) == 0 {
		return 0
	}
	count := 1
	for i := 1; i < len(data); i++ {
		if data[i] != data[i-1] {
			count++
		}
	}
	return count
}

func UniqueCount2(data []int) int {
	slices.Sort(data)
	if len(data) == 0 {
		return 0
	}
	count := 1
	for i := 1; i < len(data); i++ {
		if data[i] != data[i-1] {
			count++
		}
	}
	return count
}

func UniqueCount3(data []int) int {
	uniques := make(map[int]bool)
	for _, num := range data {
		if !uniques[num] {
			uniques[num] = true
		}
	}
	return len(uniques)
}
