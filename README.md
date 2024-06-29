# Queue-luau
a typesafe O(n) queue library for luau
# Example
All functions are listed in [Methods](https://github.com/daolgierd/Queue-luau/edit/main/README.md#methods)
```luau
local queue = require(...)
local foo = queue.new()
foo:push("foo")
foo:push("bar")
foo:push("baz")
local popped = foo:pop()
print(popped) --> 'foo'
```
# Methods
- `:push(value: T)` - Add value to queue.
- `:pop()` - Remove the first value from queue and return it.
- `:peek()` - Returns the first value from queue but does not remove it.
- `:get(index: number?)` - If no `index` provided it will return the full `queue` in table`.
- `:set(index: number, value: T)` - Sets the `value` at given `index`.
- `:size()` - Returns the size of the queue.
- `:clear()` - Clears the entire queue.
