#define CATCH_CONFIG_MAIN
#include "catch_amalgamated.hpp"
#include "add.h"

TEST_CASE("Basic addition", "[add]") {
    REQUIRE(add(2, 3) == 5);
    REQUIRE(add(-1, -1) == -2);
    REQUIRE(add(0, 0) == 0);
}
