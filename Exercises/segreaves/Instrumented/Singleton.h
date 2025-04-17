#pragma once

// T is semiregular or regular or totally-ordered
template <typename T>
struct Singleton
{
	typedef T value_type;
	T value;

	// Conversions from T and to T
	explicit Singleton(const T& x) : value(x) {}
	explicit operator T() const { return value; }
	// Templated conversion
	template<typename U>
	Singleton(const Singleton<U>& x) : value(x.value) {}

	// Semi-regular requirements
	Singleton() {}// Default constructor
	Singleton(const Singleton& x) : value(x.value) {}// Copy constructor
	~Singleton() {}// Destructor

	Singleton& operator=(Singleton& x)
	{
		value = x.value;
		return *this;
	}

	// Regular
	friend bool operator==(const Singleton& l, const Singleton& r) { return l.value == r.value; }
	friend bool operator!=(const Singleton& l, const Singleton& r) { return !(l == r); }
	// Totally-orderred
	friend bool operator<(const Singleton& l, const Singleton& r) { return l.value < r.value; }
	friend bool operator>(const Singleton& l, const Singleton& r) { return r < l; }
	friend bool operator<=(const Singleton& l, const Singleton& r) { return !(r < l); }
	friend bool operator>=(const Singleton& l, const Singleton& r) { return !(l < r); }
};
