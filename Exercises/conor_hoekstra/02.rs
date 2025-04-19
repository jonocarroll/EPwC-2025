fn min_max(values: Vec<i32>) -> Option<(i32, i32)> {
    values.iter().fold(None, |acc, &value| {
        match acc {
            None => Some((value, value)),
            Some((min, max)) => {
                Some(if value < min {
                    (value, max)
                } else if value > max {
                    (min, value)
                } else {
                    (min, max)
                })
            }
        }
    })
}