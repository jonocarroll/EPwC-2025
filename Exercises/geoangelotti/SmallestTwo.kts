fun smallestTwoSort(nums: IntArray): Pair<Int, Int> {
    if (nums.size < 2) {
        throw IllegalArgumentException("Need at least 2 numbers")
    }
    nums.sort()
    return Pair(nums[0], nums[1])
}

fun smallestTwo(nums: IntArray): Pair<Int, Int> {
    if (nums.size < 2) {
        throw IllegalArgumentException("Need at least 2 numbers")
    }
    val initial = Pair(Int.MAX_VALUE, Int.MAX_VALUE)
    return nums.fold(initial) { (smallest, secondSmallest), current ->
        when {
            current < smallest -> Pair(current, smallest)
            current < secondSmallest && current != smallest -> Pair(smallest, current)
            else -> Pair(smallest, secondSmallest)
        }
    }
}