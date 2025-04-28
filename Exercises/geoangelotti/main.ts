function windows<T>(arr: Array<T>, size: number): Array<Array<T>> {
  if (!arr || arr.length < size || size <0) {
    return [];
  }
  const acc: Array<Array<T>> = [];
  for (let i = 0; i <= arr.length - size; i++) {
    const window = [];
    for (let j = 0; j < size; j++) {
      window.push(arr[i + j]);
    }
    acc.push(window);
  }
  return acc;
}

function tupleWindows<T>(arr: Array<T>): Array<Array<T>> {
  return windows(arr, 2);
}

export function uniqueCount(arr: Array<number>): number {
  return tupleWindows(arr.sort((a,b)=> +a-(+b))).filter((a)=> a[0] !== a[1]).length + 1;
}

// Learn more at https://docs.deno.com/runtime/manual/examples/module_metadata#concepts
if (import.meta.main) {
  console.log(uniqueCount([1, 3, 1, 4, 1, 5]));
}
