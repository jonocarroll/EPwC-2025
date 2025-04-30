SmallestTwoWithSort ← 2↑∧
SmallestTwo ← { 2>≠𝕩? 𝕩 ; (2↑𝕩) { x𝕊a‿b: {x<b?x‿a;x<b?a‿x;a‿b} }´2↓𝕩 }

# Tests
•Show SmallestTwoWithSort 1‿5‿3‿4‿2
•Show SmallestTwo         1‿5‿3‿4‿2
•Show SmallestTwo         3⥊10
