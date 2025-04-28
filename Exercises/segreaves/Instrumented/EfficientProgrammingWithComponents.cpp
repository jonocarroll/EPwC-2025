#include <iostream>
#include "Singleton.h"
#include "Pair.h"

int main()
{
    std::cout << "Singleton" << std::endl;
    Singleton<int> s1{ 1 };
    std::cout << "s1: " << s1.value << std::endl;
    Singleton<int> copy_of_s1{ s1 };
    std::cout << "copy_of_s1: " << copy_of_s1.value << std::endl;
    copy_of_s1.value += 1;
    std::cout << "Added 1 to copy_of_s1: " << copy_of_s1.value << std::endl;
    Singleton<int> s2;
    s2 = copy_of_s1;
    std::cout << "s2 = copy_of_s1: " << s2.value << std::endl;
    std::cout << "s1 < s2: " << (s1 < s2 ? "true" : "false") << std::endl;
    std::cout << "s2 == copy_of_s1: " << (s2 == copy_of_s1 ? "true" : "false") << std::endl;
    
    std::cout << "\n" << "Pair" << std::endl;
    Pair<int, float> p1{ 1, 1.1 };
    std::cout << "p1: [" << p1.first << ", " << p1.second << "]" << std::endl;
    Pair<int, float> copy_of_p1{ p1 };
    std::cout << "copy_of_p1: [" << copy_of_p1.first << ", " << copy_of_p1.second << "]" << std::endl;
    copy_of_p1.first++;
    copy_of_p1.second *= 2;
    std::cout << "copy_of_p1.first++, copy_of_p1.second *= 2: [" << copy_of_p1.first << ", " << copy_of_p1.second << "]" << std::endl;
    Pair<int, float> p2;
    p2 = copy_of_p1;
    std::cout << "p2 = copy_of_p1: [" << p2.first << ", " << p2.second << "]" << std::endl;
    std::cout << "p1 < p2: " << (p1 < p2 ? "true" : "false") << std::endl;
    p1.first++;
    std::cout << "p1.first++: [" << p1.first << ", " << p1.second << "]" << std::endl;
    std::cout << "p1 < p2: " << (p1 < p2 ? "true" : "false") << std::endl;
    std::cout << "p1 > p2: " << (p1 > p2 ? "true" : "false") << std::endl;
    std::cout << "p1 == p2: " << (p1 == p2 ? "true" : "false") << std::endl;
    p1.second *= 2;
    std::cout << "p1.second *= 2: [" << p1.first << ", " << p1.second << "]" << std::endl;
    std::cout << "p1 == p2: " << (p1 == p2 ? "true" : "false") << std::endl;
}
