use num_traits::Bounded;

pub fn min_max<T: Bounded + Ord + Copy>(values: &[T]) -> (T, T) {
    values
        .iter()
        .fold((T::max_value(), T::min_value()), |(ac_min, ac_max), &x| {
            (
                if x < ac_min { x } else { ac_min },
                if x > ac_max { x } else { ac_max },
            )
        })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_min_max() {
        let values = [3, 1, 4, 1, 5, 9, 2, 6, 5];
        let result = min_max(&values);
        assert_eq!(result, (1, 9));
    }
}
