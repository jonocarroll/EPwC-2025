// Assume v is sorted
fn count_unique<T: Eq> (v: &[T]) -> usize {
    if v.is_empty() {
        return 0;
    }
    // Count unique elements by comparing adjacent elements
    v.iter()
        .zip(v[1..].iter())
        .filter(|(a, b)| a != b)
        .count() + 1
}


fn main() {
    let mut v = vec![1, 2, 2, 3, 4, 4, 5];
    v.sort();
    let unique_count = count_unique(&v);
    println!("Number of unique elements: {}", unique_count);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_count_unique() {
        assert_eq!(count_unique(&[1, 2, 2, 3, 4, 4, 5]), 5);
        assert_eq!(count_unique(&[1, 1, 1]), 1);
        assert_eq!(count_unique(&[1, 2, 3]), 3);
        assert_eq!(count_unique::<i32>(&[]), 0);
        assert_eq!(count_unique(&[1]), 1);
    }

}