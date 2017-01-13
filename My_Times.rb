#implimentation of 5.times like method(codeblock & yield)
class Integer
  def my_times
    c=0
    until c == self
      yield(c)
      c += 1
    end
    self
  end
end

#testing
10.my_times{|i| puts "Iteration #{i}!"}

