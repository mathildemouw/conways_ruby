def describe(class_or_method)
	puts "describing #{class_or_method},"
	yield
end

def it(description)
	puts "if it works, it #{description}"
	yield
end

def expect(behavior)
 if behavior 
 	puts "*"
 else 
 	puts "FAILED \n\n"
 end	
end
