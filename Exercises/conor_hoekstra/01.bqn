
DistinctCount  ← ≠⍷  # deduplicate
DistinctCount2 ← +´∊ # unique mask

# Tests
•Show DistinctCount  •Show 1‿3‿1‿4‿1‿5   # 4
•Show DistinctCount2 •Show 1‿3‿1‿4‿1‿5   # 4
