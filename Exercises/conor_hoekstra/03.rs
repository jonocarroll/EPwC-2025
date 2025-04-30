fn min2(values: Vec<i32>) -> Option<(i32, i32)> {
    if values.is_empty() { return None; }
    let f = values[0];
    if values.len() == 1 { return Some((f, f)); }
    Some(values.iter().skip(1).fold((f, f), |(a, b), &x| {
        if      x < a { (x, a) } 
        else if x < b { (a, x) }
        else          { (a, b) }
    }))
}
