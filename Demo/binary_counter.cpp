#include <iostream>
#include <vector>

// Class implementation. State:
// - vector for the counter
// - zero
// - op

template <typename T, typename Op> class binary_counter {
private:
  std::vector<T> counter;
  Op op;
  T zero;

public:
  // Constructor. Input arguments: op and zero.
  binary_counter(const Op &op, const T &zero) : op(op), zero(zero) {
    counter.reserve(24);
  }

  // add
  void add(T x) {

    x = add_to_counter(counter.begin(), counter.end(), op, zero, x);
    if (x != zero)
      counter.push_back(x);
  }

  // reduce
  // returns: value of the counter
  T reduce() {
    return reduce_counter(counter.begin(), counter.end(), op, zero);
  }
};

template <typename T, typename I, typename Op>
// requires Op is BinaryOperation(T)
// and Op is associative
// and I is ForwardIterator and ValueType(I) == T
T add_to_counter(I first, I last, Op op, const T &zero, T carry) {
  // precondition: carry != zero
  while (first != last) {
    if (*first == zero) {
      *first = carry;
      return zero;
    }
    carry = op(*first, carry);
    *first = zero;
    ++first;
  }
  return carry;
}

template <typename T, typename I, typename Op>
// requires Op is BinaryOperation(T)
// and Op is associative
// and I is ForwardIterator and ValueType(I) == T
T reduce_counter(I first, I last, Op op, const T &zero) {
  while (first != last && *first == zero) {
    ++first;
  }
  if (first == last)
    return zero;

  T result = *first;
  while (++first != last) {
    if (*first != zero) {
      result = op(*first, result);
    }
  }
  return result;
}

// TODO: implement min_element_binary, using binary_counter

// - compares two iterators and returns the one
//   pointing to the smallest element
template <typename Compare> class min_op {
private:
  Compare cmp;

public:
  min_op(const Compare &cmp) : cmp(cmp) {}
  template <typename I> I operator()(const I &x, const I &y) {
    return cmp(*y, *x) ? y : x;
  }
};

template <typename I, typename Compare>
// requires I is a ForwardIterator
// and Compare is a StrictWeakOrdering on ValueType(I)
I min_element_binary(I first, I last, Compare cmp) {
  binary_counter<I, min_op<Compare>> min_counter(min_op<Compare>(cmp), last);
  while (first != last)
    min_counter.add(first++);
  return min_counter.reduce();
}

int main() {

  // plugin whatever numbers you want to test with
  auto data = std::vector<int>{9,   13,  7,  124, 32, 17, 8, 32,
                               237, 417, 41, 42,  13, 14, 15};
  int *end = data + sizeof(data) / sizeof(int);
  int *min = min_element_binary(data, end, std::less<int>());
  if (min == end) {
    std::cout << "No elements" << std::endl;
  } else {
    std::cout << "Min is " << *min << std::endl;
  }
}