#include "Dummy.hpp"

#include <iostream>

Dummy::Dummy(const int& value) :
    m_value(value)
{
}

void Dummy::print()
{
    std::cout << "Value: " << m_value << std::endl;
}

