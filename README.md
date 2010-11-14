# lambda.lua
Terse lambda definitions for Lua. Best used in combination with [underscore.lua](https://github.com/mirven/underscore.lua).

## Usage
Define your lambda functions like this:

    l = require("lambda")
    add = l("(a,b) -> a+b")
    add(1,2)
    => 3

Support for variable numbers of arguments:

    l("(...) -> arg.n")(1,2,3,4)
    => 4

Use it with [my fork of underscore.lua](https://github.com/mkilling/underscore.lua/tree/develop) for extra awesome:

    _ = require("underscore")
    l = require("lambda")
    add = l("(...) -> _(arg):chain():pluck_all():map(_.sum):value()")

    local vector1 = {100, 50, 20}
    local vector2 = {20, 20, 0}
    add(vec1, vec2)
    => {120, 70, 20}
