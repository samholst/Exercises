# TypeScript

## Ruby Inheritance
- In OOP, inheritance enables new objects to take on the properties of existing objects, thus DRYing up your code and making things easier to use.

- A Class (or object) that is used as the basis for inheritance is called a *superclass* or *base* class, and another class that inherits from it is called a *subclass* or sometimes a *derived* class

## Uruk Hai
- Superclass, Parent, base

- Subclass, derived, child

````Ruby
class Person
  def breathe
    puts "inhale and exhale"
  end
end

p Person.ancestors    # => [Person, Object, Kernel, BasicObject]
````

## BasicObject
- Everything essentially inherits from this
- Is the parent class of all classes in Ruby
- It is an explicit blank class from which all other classes extend
- Top-tier object in Ruby

## Kernel
- Isn't actually a class, but a module which is included inside of the Object class
- ````puts, gets, chomp, sleep, gem, rand, eval, proc, print, require, exit, binding````
- virtually all Ruby objects inherit from Object and have access to the methods defined in the Kernel module, so Kernel's private instance methods are accessible virtually anywhere in a Ruby program, regardless of self.
- In short terms, You get these private (kernel)...

## Object
- Is the default root of all Ruby objects
- Default parent of all classes
- Inherits from BasicObjects which allows creating alternate object hierarchies
- Methods on objects are available to all classes unless explicitly overridden
- Mixes in the Kernel module, making the built-in kernel functions globally accessible
- Everything in Ruby is an Object*

````Ruby
p Class.ancestors
````

## Hierarchy
- ````BasicObject -> Kernel (module) -> Object -> Module -> Class````

````Ruby
class Baby < Person
  def speak
    puts "Goo Goo Ga Ga"
  end
end

p Baby.methods.sort
````

Do you see .breathe and .speak? No, this is because it is not able to be called on itself. We must add ````self.speak```` to this baby class.

````Ruby
class Baby < Person
  def self.speak
    puts "Goo Goo Ga Ga"
  end
end

p Baby.methods.sort
````

Let's take out the self. method calls

````Ruby
class Person
  def breathe
    puts "inhale and exhale"
  end
end

class Baby < Person
  def speak
    puts "Goo Goo Ga Ga"
  end
end

my_baby = Baby.new
p my_baby.methods.sort
````

As you can see, the methods still show up once the object is instantiated.

When a method is called on an instantiated class, the Ruby interpreter look sup it's ancestry chain to find the proper code and call it.

When a class method is called, it won't be able tot find it, because it is in an entirely different place.

Ruby actually creates two classes in memory when you create an instance of a class. One is the instance of the class and one is something called the ````meta class```` where Ruby saves values specific to the method classes.
