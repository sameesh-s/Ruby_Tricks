To only syntax checking not running
-----------------------------------
ruby -cw prg.rb
  c check for syntax errors
  w activates the higher level of warning 

To locate where ruby installation files are located
----------------------------------------------------
irb --simple-prompt -rrbconfig
RbConfig::CONFIG["bindir"]

it is a constant referring to the hash
  rubylibdir
  sitelibdir
  vendordir
  sitearchdir


Anatamy of Ruby installation
----------------------------
several disk directories worth of Ruby-language libraries and support files.
To get information in irb session:
irb --simple-prompt -rrbconfig
described above
basic formula: RbConfig::CONFIG["term"]
  rubylibdir : Ruby standard library
      here are the files which can include in the program by requiring like open-uri, uri, prettyprint. these files are written in ruby. These are the library collection that are come with ruby. To utilize maximum usege of the files will improve efficency of your program
  bindir : Ruby command line tools( erb, gem, irb, rake, rdoc, ri, ruby)
  
  archdir: The C extensions library 
    Usually located one folder down to the rubydir, It contains architecture specefic extensions and libraries. The files in this directory typically have names ending in .so, .dll or .bundle. These files are C extensions: binary, runtime-loadable files generated from Ruby's C-language extension code, compiiles into binary from as part of te Ruby installation process.
These files can also load into your ruby program

  sitedir : here we save the third party library or extensions

  vendordir : here purpose is also same as the sitedir

in the parent folder of site_dir, vendor_dir we can also see a gem folder where when gems installed the files goes there


require, load
-------------
These two methods are used to load extension at runtime, including the extension you write. 
load will load the file in the execution line order. Ruby will firstly look into the current directory then look into the load path
load path can be view by:
ruby -e 'puts $:'
We can also place relational path into load (like .. -> parent directory)
load "../extras.rb"
We can also force load a file, regardeless of the contents of the load path, by giving fully qualified name
load "/home/xcave/ru/jj.rb"

load is a method not a directive so it will execute at the point where ruby encounters it. Ruby doesn't search the whole file looking for load directives. This means you can load files whose names are determined dynamically during the run of the program. You can even wrap a load call in a conditional statement, in which case the call will be executed only if the condition is true.

A call to load will always load the file if youre already loaded or not. The plus side of this is that when any change occured to the file during the between it will be visible in the second load.


Require
-------
require also search the file in the load path.
major diffrence between load is that when require doesn't reload the file that is already loaded.
Ruby keeps track of which files you required and not make a duplicate effort.
require dosn't know about the current directory so you have to specefy it in the statement or append in the load path
require "./lll.rb" -> for current directory
We can also force load the require by giving full path

on daily purpuse we use the require unless we wanted to load the file more than once

require_relative
----------------
this will load the file by searching relative to the current directory, convinent to navigate the local hierachy.
require_relative "music/sigma/ll.rb"

Command line tools avilabile with ruby
--------------------------------------
ruby
-----
Interpreter has command line switches, -e, -c, -w, -l, -v
irb
----
in ruby every assignment expression has a value that is the right hand side of the expression.
irb --simple-prompt --noecho (The statement dosnt report back)
irb --simple-prompt -rrbconfig
normal exit : exit, CTRL+D
abrupting : Ctrl+C or Ctrl+Z

ri and rdoc
-----------
documentaion tools for ruby.
rdoc( Ruby Documentation )
create a index like documentation from the comments inside the programs
ri( Ruby Index )
search through the indexed documentation, rdoc maid to give the documentation
eg: ri String#upcase
it will give info about the upcase instance method(object method) #
for class method we use ::

Rake
----
Ruby make : rake reads and executes tasks defined in a file

eg: rake ns:tk

namespace :ns do
  desc "this will desplay when running rake --task"
  task :tk
    statements
  end
end

you can also omite the namespace and define task in the top 
you can also nest the namespaces

GEM
----
third party packages
gem install <gem_name>
we can also install gems from the locally from the hard disk by specfing the name of the file
gem install /home/xcaa/r.9.0.gem
To uninstall a gem : gem uninstall <gem_name>
To view the installed gem : gem list

A class in Ruby itself as an object
------------------------------------
------------------------------------

creating a generic object
------------------------
obj = Object.new
all object in ruby is created with inate abilitys that certian methods that they know how to execute it.

anatomy of a method defenition
------------------------------
def obj.talk
  puts "meow...meow"
end

Dot(.) operator
---------------
It is a messege sending operator the right side messege (method) is send to the left side variable that stands for object/Litteral("string")

in ruby every method call is an expression, the method call evaluvates something. This is retren value.
the last expression is returned from the method, we can also make return explicit by using return keyword.

String Interpolation
--------------------
A string Interpolation variable givers you to drop anything into a string variable: " string #{ obj.talk }"
String concatination +

nil, true, false are objects of ruby (false, true are used to store the result of comparison operator)
every expression in ruby evaluvates to an object, and every object in ruby has a truth value, and truth value of every object in the ruby is true and only false and nil has the truth value false

Cutting out trailing newline charecter
-------------------------------------
gets.chomp, chomps

Objects
-------
Generic objects: Object.new
Basic objects: BasicObjec.new

Sponging the arguments of the method arguments
----------------------------------------------
Required arguments: method(a)
Default arguments: method(a=10)
Optional arguments: method(*a)

def methodname(*x)
default value to arguments : c=1
*x gets the lowest priority in the arguments assignment

The innate behaviors of an object
---------------------------------
p Object.new.methods.sort

* object_id
-----------

* respond_to?
-------------
obj.respond_to?(method_name)

* send (synonym:__send__)
-------------------------
calling method name using send.
obj.__send__(methodname)

Variables, Object and Reference
-------------------------------
variable get the apperance and the effect of the object on the right side of the expression
Variable in ruby dosnt hold the object value rather it hold the reference to an object.
if two variables pointed to same object, then both of them have the variables have the same object_id.
In an assignment with a variable name on the left and an object on the right, the
variable receives a reference to the object. In an assignment from one variable to
another ( abc = str ), the variable on the left receives a copy of the reference stored in
the variable on the right, with the result that both variables now contain references to
the same object.
Some objects in Ruby are stored in variables as immediate values. These include
integers, symbols (which look like :this), and the special objects true, false, and
nil. When you assign one of these values to a variable (x = 1), the variable holds
the value itself, rather than a reference to it.
The immediate, unique nature of integer-bound variables is behind Ruby’s lack of
pre- and post-increment operators—which is to say, you can’t do this in Ruby: x++, ++x
For every object in Ruby, there can and must be one or more references to that object.
If there are no references, the object is considered defunct, and its memory space is
released and reused.
Reference have many-to-one relation ship with objects
Every time you assign to a variable—every time you put a variable name to the left of
an equal sign and something else on the right—you start from scratch: the variable is
wiped clean, and a new assignment is made.
Unlike some languages, Ruby doesn’t have typed
variables. Any variable can be bound to any object of any class at any time.
Reference and method arguments: once one method gets hold of one reference it wold also visible to other references.
duping and freezing objects: when we pass the duplication of variable => s.dup
you can also freez object from further modification: s.freeze => it will give errors if try to modify it
note that there is no unfreezing method freezing is forever
clone : same as the dup but if you clone a frozen object the clone is also frozen
local variables and the things that look like them
keyword, methodcall
Here’s how Ruby decides what it’s seeing when it encounters a plain identifier:
If the identifier is a keyword, it’s a keyword (Ruby has an internal list of these
and recognizes them).
If there’s an equal sign ( = ) to the right of the identifier, it’s a local variable
undergoing an assignment.
Otherwise, the identifier is assumed to be a method call.

instance methods : defined inside class
singleton methods : defined with object => object_name.method
Overriding methods : we can write method again after the defining this is called overriding. When you override a method the new version take precedence.

Instance Variables
------------------
always atrt with a @
Only visible to belonging object
a variable defined inside a method can be used by anymethod inside that class.( Unlike local variable )

Initilization (Constructor)
---------------------------
initialize method will executed every time you create a new instance of class.

Getter in Ruby
--------------
Read back the value
def venu
  @venu
end

[TIPS]we can use sprintf inside ruby puts, ri sprintf

Setter method
-------------
def set_name(name)
  @name=name
end

or 

def name=(name)
  @name= name
end

syntactic sugar: we are allowed to do, obj.name = name
we can use setters to normalize data like precesion trimming
month, day, year = date.split('/')

Attributes and attr_* method family
-----------------------------------
attribute is property whose value can be read and/or written through object.  
Ruby can create setters and getters more easily and avoid repetetion of the above processing(setter/getter)
attr_reader :venue, :date 
this will provide getter method for variable names venue and date
:venue is called as symbols are kind of lableling pretty much similer to strings.
attr_writer :price
attr_accessor :price
attr :price, true (same as attr_accesor )

Inheritance and the Ruby Class Hierarchy
-----------------------------------------
Downward chaining relationship between two classes ( super class and sub class )and subclass aquire the method of the super class.

calss Magazine < Publication
end

mag.is_a?(Publication)

Object get their behaviors from theri classes, from their individual singleton methods, and also from their ancestors.

Limitation of Inheritence
-------------------------
Ruby doesn't allow multiple inheritance.
But ruby provides multiple module extending to a class.

every class in Ruby ultimately descends from the object class.( and BasicObject class )

obj.superclass.superclass.methods

BasicObject : we can create BasicObject in IRB but it dosnt shown in IRB because BasicObject dosnt have the inspect method, it has 8 instance methods whereas Object has 55 methods.
[TIPS] classes are objects because when we create an object we pass an messege(method) to a object(class name) :: so classes are object in Ruby.
Classes are special object that has the power to spawn (instantiate) other object.

Classes are object in Ruby
---------------------------
Fixnum.class
Class.class
Class.methods

in ruby we can create classes in 
my_class = Class.new
my_class.class
my_class.superclass

the speciality comes that when you create class object that object can instantiate its own object.
instance_of_my_class = my_class.new

Creating instence method withe class.new
c = Class.new do
  def sy
    puts "sy"
  end
end

What happens if a singletor method is defined for class?
--------------------------------------------------------
$what is array.max_by()
the method will have work withe several object and called with class.method

Constant
---------
naming : full capital letter , changing the value of the constat will give you warning, changing the reference variable value is modification and dosnt give any warning.
Math::PI
Math::E

we can change the values of the constant by using the << operator in an array.

Modules
-------
modular programming
superclass of Class
You saw that all objects descend from Object ; here, you’ll meet the Kernel
module that contains the majority of the methods common to all objects.
You learned that objects seek their methods in both class and superclass, all
the way up the inheritance tree; in this chapter, we’ll look in considerable
detail at how this method-lookup process works when both classes and mod-
ules are involved.

module MyFirstModule
  def sayHello
    p "hello"
  end
end
  
modules don't have instances they just get mixed in with classes, using include method or the prepend( Ruby 2.0 ) method.

require/load vs include/prepend
-------------------------------
require/load will have to locate the files in the disk so it will have to take string argument.
include/prepend will have to locate Constant (module name) so it will look into in memeory space not in disk space so it only need a constant.

[TIPS]the internal defenitions of kernel, BasicObject and Object are written in C.

include vs prepend
------------------
in include the method lookup will begin inside class and then look into module. In prepend the method lookup will start in module and then class.

[TIPS]Classname.ancestors will give the loaded modules and inherited classes in order of inheritence.

super
-----
it can search the method in the ancestors.
super : it will pass the same arguments
super() : no argument
super(a, b, c) : pass specefic argument.

method_missing (when method look up fail )
--------------
the kernel module specefy an instence of method_missing method.

method_missing(m, *args)
  puts "you cant call #{m} on this object"
end

self
----
To find self : puts self

what is self when you haven't enterd any defenition block: main
ruby -e 'puts self'

Global variables that are preloaded in ruby
--------------------------------------------
$0 which file is running
$: load path
$$ process id

To view Kernel methods 
-----------------------
ruby -e 'p Kernel.private_instance_methods.sort'
ruby -e 'p Kernel.methods'
we can provide sysytem command using Kernel methods from inside ruby programming.

Conditional Modifiers
---------------------
puts "Big number" if x > 100

puts "Big Number" unless x<=100

Return value of if statement is true or false

Control structure
-----------------
Unconditional looping
---------------------
loop
next
break

Conditional Looping
--------------------
while <condition>
....
end

begin 
.....
end while <condition>

until <condition>
......
end

n=n+1 until n==10

Looping based on a list of values
---------------------------------
for c in array
.....
end

Iterator
--------
Codeblock + yeild
If a method has a code block then the method can yield else it cant.

Anatomy of a method call
------------------------
syntax
A receiver object or variable (defaulting to self if absent)
A dot (required if there’s an explicit receiver; disallowed otherwise)
A method name (required)
An argument list (optional; defaults to () )
A code block (optional; no default)

each vs map
-----------
both methods used to walk through elements, But the diffrence is that map will return us a new array each won't.

Error handling and exceptions
-----------------------------
Ruby handles unacceptable behavior at runtime by raising an exception.
An exception is a special king of object, an instance of the class Exception or a descendant.
Raising an exception means stopping normal execution of the program completely.
when exception happens, it will search for rescue clause, if not provided the program terminates.


begin
  fussy_method(20)
rescue ArgumentError => e
  puts "That was not an acceptable number!"
  puts "Here's the backtrace for this exception:"
  puts e.backtrace
  puts "And here's the exception object's message:"
  puts e.message
end

begin 
  raise
rescue
  ...
ensure
  ...
end

Creating your own exception
--------------------------
class MyNewException < Exception
end


BUILT IN CLASSES AND METHODS
____________________________
____________________________


