def my_loop
  yield while true
end

my_loop { puts "My_loop forever!"}

