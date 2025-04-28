fn min_max(values: Vec<i32>) -> Option<(i32, i32)> {
    values.iter().fold(None, |acc, &value| {
        match acc {
            None => Some((value, value)),
            Some((min, max)) => {
                match value {
                    v if v < min => Some((v, max)),
                    v if v > max => Some((min, v)),
                    _ => Some((min, max))
                }
            }
        }
    })
}
