use rand::seq::SliceRandom;
use std::collections::{BTreeSet, HashSet};
use std::hash::{BuildHasher, Hash, RandomState};

#[inline]
fn unique_btree_set<T>(v: Vec<T>) -> usize
where
    T: Ord,
{
    let set = BTreeSet::from_iter(v.into_iter());
    set.len()
}

#[inline]
fn unique_hash_set<T, S>(v: Vec<T>, _: S) -> usize
where
    T: Ord + Hash,
    S: BuildHasher + Default,
{
    let set: HashSet<T, S> = HashSet::from_iter(v.into_iter());
    set.len()
}

#[inline]
fn unique_sort<T>(mut v: Vec<T>) -> usize
where
    T: Ord,
{
    v.sort();
    v.dedup();
    v.len()
}

#[inline]
fn unique_unstable_sort<T>(mut v: Vec<T>) -> usize
where
    T: Ord,
{
    v.sort_unstable();
    v.dedup();
    v.len()
}

fn random_vec(size: usize) -> Vec<u64> {
    let mut v: Vec<_> = (0..size as u64).collect();
    let mut rng = rand::rng();
    v.shuffle(&mut rng);
    v
}

use criterion::{BatchSize, BenchmarkId, Criterion, criterion_group, criterion_main};

fn bench_uniques(c: &mut Criterion) {
    let mut group = c.benchmark_group("bench_uniques");
    let mut size = 16usize;
    while size <= 16 * 1024 * 1024 {
        group.bench_with_input(BenchmarkId::new("BTreeSet", size), &size, |b, &size| {
            b.iter_batched(
                || random_vec(size),
                |v| unique_btree_set(v),
                BatchSize::SmallInput,
            )
        });

        group.bench_with_input(BenchmarkId::new("HashSet", size), &size, |b, &size| {
            b.iter_batched(
                || random_vec(size),
                |v| unique_hash_set(v, RandomState::new()),
                BatchSize::SmallInput,
            )
        });

        group.bench_with_input(BenchmarkId::new("Sort", size), &size, |b, &size| {
            b.iter_batched(
                || random_vec(size),
                |v| unique_sort(v),
                BatchSize::SmallInput,
            )
        });

        group.bench_with_input(BenchmarkId::new("UnstableSort", size), &size, |b, &size| {
            b.iter_batched(
                || random_vec(size),
                |v| unique_unstable_sort(v),
                BatchSize::SmallInput,
            )
        });

        size <<= 4;
    }
    group.finish();
}

criterion_group!(benches, bench_uniques);
criterion_main!(benches);
