# lambda.lua
Terse lambda definitions in Lua. Best used in combination with [underscore.lua](https://github.com/mirven/underscore.lua).

## Usage
Define your lambda functions like this:

    l = require("lambda")
    add = l("(a,b) -> a+b")
    add(1,2)
    => 3

Support for variable numbers of arguments:

    l("(...) -> arg.n")(1,2,3,4)
    => 4

Use it with [my fork of underscore.lua](https://github.com/mkilling/underscore.lua) for extra awesome:

    _ = require("underscore")
    l = require("lambda")
    vector = {}
    vector.add = l("(...) -> _(arg):chain():pluck_all():map(_.sum):value()")

    local vec1 = {100, 50, 20}
    local vec2 = {20, 20, 0}
    add(vec1, vec2)
    => {120, 70, 20}