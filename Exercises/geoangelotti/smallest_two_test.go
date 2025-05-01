package epwc_test

import (
	"epwc"
	"reflect"
	"testing"
)

var HundredNumbers = [100]int{
	81, 878, 421, 695, 133, 376, 703, 255, 358, 165,
	96, 776, 932, 583, 39, 631, 739, 315, 686, 907,
	118, 52, 945, 859, 488, 219, 591, 184, 897, 623,
	750, 46, 308, 827, 191, 663, 984, 28, 515, 792,
	437, 918, 609, 14, 271, 548, 365, 882, 714, 238,
	995, 17, 403, 840, 652, 331, 769, 92, 575, 202,
	499, 867, 294, 105, 679, 343, 786, 953, 410, 536,
	225, 813, 64, 389, 727, 970, 562, 151, 474, 89,
	320, 744, 99, 616, 25, 507, 834, 121, 688, 351,
	798, 939, 452, 188, 59, 264, 871, 396, 70, 519,
}

func TestEvaluateSmallest(t *testing.T) {
	input := []int{1, -1, 1, 4, 1, 0}
	smallestTwo1 := epwc.SmallestTwoSort(input)
	smallestTwo2 := epwc.SmallestTwoSortInts(input)
	smallestTwo3 := epwc.SmallestTwo(input)
	res := []int{-1, 0}
	assert := func(value []int) {
		if !reflect.DeepEqual(res, value) {
			t.Errorf("Expected %v but got %v", res, value)
		}
	}
	assert(smallestTwo1)
	assert(smallestTwo2)
	assert(smallestTwo3)
}

func BenchmarkSmallestTwoSort(b *testing.B) {
	for b.Loop() {
		_ = epwc.SmallestTwoSort(HundredNumbers[:])
	}
}

func BenchmarkSmallestTwoSortInts(b *testing.B) {
	for b.Loop() {
		_ = epwc.SmallestTwoSortInts(HundredNumbers[:])
	}
}

func BenchmarkSmallestTwo(b *testing.B) {
	for b.Loop() {
		_ = epwc.SmallestTwo(HundredNumbers[:])
	}
}
