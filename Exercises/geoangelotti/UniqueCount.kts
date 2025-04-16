fun uniqueCount(nums: IntArray): Int =
    nums.groupBy { it }.size

println(uniqueCount(intArrayOf(1, 3, 1, 4, 1, 5)))
