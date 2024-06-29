--!strict

local class = {}
class.__index = class

type class<T> = {
  __index: class<T>,
  new: () -> Queue<T>,

  push: (self: Queue<T>, value: T) -> (),
  pop: (self: Queue<T>) -> T,
  size: (self: Queue<T>) -> number,
  peek: (self: Queue<T>) -> T,
  get: (self: Queue<T>, index: number?) -> T,
  set: (self: Queue<T>, index: number, value: T) -> (),
  clear: (self: Queue<T>) -> (),
}

export type Queue<T> = typeof(setmetatable({} :: {
  last: number,
  first: number,
  queue: {T},
}, class :: class<T>))

function class.new<T>(): Queue<T>
  return setmetatable({
    first = 0,
    last = -1,
    queue = {},
  }, class)
end

function class:push(value: any)
  self.last += 1
  self.queue[self.last] = value
end

function class:pop()
  assert(self.first <= self.last, "[Queue]: Is empty.")
  local popped: any = self.queue[self.first]
  self.queue[self.first] = nil
  self.first += 1
  return popped
end

function class:peek(): any
  assert(self.first <= self.last, "[Queue]: Is empty.")
  return self.queue[self.first]
end

function class:get(index: number?): any
  assert(self.first <= self.last, "[Queue]: Is empty.")
  return if index then self.queue[self.first + index] else self.queue
end

function class:set(index: number, value: any)
  assert(self.first <= self.last, "[Queue]: Is empty.")
  assert(index >= 0 and index < self:size(), "[Queue]: Index out of bounds.")
  self.queue[self.first + index] = value
end

function class:size(): number
  return self.last - self.first + 1
end

function class:clear()
  self.first = 0
  self.last = -1
  self.queue = {}
end

return class
