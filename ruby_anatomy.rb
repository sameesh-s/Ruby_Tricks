require 'rbconfig'
puts "Installation directeries of Ruby"
puts "--------------------------------"
puts "Ruby command-line tools                                                 : #{RbConfig::CONFIG['bindir']}"
puts "Ruby standard library                                                   : #{RbConfig::CONFIG['rubylibdir']}"
puts "Architecture-specific extensions and libraries (compiled, binary files) : #{RbConfig::CONFIG['archdir']}"
puts "Your own or third-party extensions and libraries (written in Ruby)      : #{RbConfig::CONFIG['sitedir']}"
puts "Third-party extensions and libraries (written in Ruby)                  : #{RbConfig::CONFIG['vendordir']}"
puts "Your own Ruby language extensions (written in Ruby)                     : #{RbConfig::CONFIG['sitelibdir']}"
puts "Your own Ruby language extensions (written in C)                        : #{RbConfig::CONFIG['sitearchdir']}"

