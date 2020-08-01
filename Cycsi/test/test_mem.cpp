#include "catch.hpp"

// include Memory module header
#include "../src/Memory.h"

Memory mem;


TEST_CASE("Check Memory Access", "[mem_tests]" ) {
    mem.write(5,5);
    REQUIRE( mem.read(5) == 5 );
}

