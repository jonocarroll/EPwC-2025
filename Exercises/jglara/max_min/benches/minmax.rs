use criterion::{criterion_group, criterion_main, BenchmarkId, Criterion};
use max_min::min_max;
use rand::Rng;

fn random_vec(size: usize) -> Vec<u64> {
    let mut rng = rand::rng();
    (0..size)
        .map(|_| rng.random_range(0..=u64::max_value()))
        .collect::<Vec<_>>()
}

fn bench_minmax(c: &mut Criterion) {
    let mut size = 1024usize;

    let mut group = c.benchmark_group("min_max_group");

    while size <= 100_000_000 {
        group.sample_size(10).bench_with_input(
            BenchmarkId::new("min_max", size),
            &size,
            |b, &size| {
                b.iter_batched(
                    || random_vec(size),
                    |v| min_max(&v),
                    criterion::BatchSize::SmallInput,
                )
            },
        );

        size <<= 4;
    }
}

criterion_group!(benches, bench_minmax);
criterion_main!(benches);
