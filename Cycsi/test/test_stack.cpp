#include "catch.hpp"

// include Memory module header
#include "../src/Stack.h"

Stack stack;


TEST_CASE("Check Stack Access", "[stack_tests]" ) {
    stack.push(5);
    REQUIRE( stack.pop() == 5 );
}

