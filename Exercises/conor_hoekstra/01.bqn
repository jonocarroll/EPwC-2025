
DistinctCount  ← ≠⍷  # deduplicate
DistinctCount2 ← +´∊ # unique mask

# Tests
•Show DistinctCount  •Show ↕10   # 10
•Show DistinctCount  •Show 2/↕10 # 10
•Show DistinctCount2 •Show ↕10   # 10
•Show DistinctCount2 •Show 2/↕10 # 10
