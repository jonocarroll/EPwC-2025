#pragma once
template<typename T, typename U>
struct Pair
{
	typedef T type_first;
	typedef U type_second;
	T first;
	U second;

	// Conversions from T & U
	explicit Pair(const T& x, const U& y) : first(x), second(y) {}
	// Templated conversion
	template<typename V, typename W>
	explicit Pair(const Pair<V, W>& x) : first(x.first), second(x.second) {}

	// Semi-regular
	Pair() {}// Default constructor
	Pair(const Pair& x) : first(x.first), second(x.second) {}// Copy constructor
	~Pair() {}// Destructor

	Pair& operator=(const Pair& x)
	{
		first = x.first;
		second = x.second;
		return *this;
	}

	// Regular
	friend bool operator==(const Pair& l, const Pair& r) { return (l.first == r.first) && (l.second == r.second); }
	friend bool operator!=(const Pair& l, const Pair& r) { return !(l == r); }

	// Totally-ordered
	friend bool operator<(const Pair& l, const Pair& r) { return (l.first < r.first) || (l.first == r.first) && (l.second < r.second); }
	friend bool operator>(const Pair& l, const Pair& r) { return r < l; }
	friend bool operator<=(const Pair& l, const Pair& r) { return !(r < l); }
	friend bool operator>=(const Pair& l, const Pair& r) { return !(l < r); }
};

