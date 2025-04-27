use criterion::{criterion_group, criterion_main, Criterion};
use max_min::min_max;
use rand::Rng;

fn random_vec(size: usize) -> Vec<u64> {
    let mut rng = rand::rng();
    (0..size)
        .map(|_| rng.random_range(0..=u64::max_value()))
        .collect::<Vec<_>>()
}

fn bench_minmax(c: &mut Criterion) {
    let v = random_vec(1_000_000);

    c.bench_function("min max random vector", |b| {
        b.iter(|| min_max(&v))
    });
}

criterion_group!(benches, bench_minmax);
criterion_main!(benches);
