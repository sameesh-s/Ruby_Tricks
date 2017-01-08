#class variable is shared among the subclass and superclass
class Parent
  @@age = 45
end

class Child < Parent
  @@age = 20
end

class Parent
  puts @@age
end

