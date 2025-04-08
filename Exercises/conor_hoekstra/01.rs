use itertools::Itertools;

fn distinct_count(data: Vec<i32>) -> usize {
    data.into_iter()
        .sorted()
        .tuple_windows()
        .filter(|(a, b)| a != b)
        .count() + 1
}

fn main() {
    let arr = vec![1, 3, 1, 4, 1, 5];
    println!("{}", distinct_count(arr)); // outputs 4
}
