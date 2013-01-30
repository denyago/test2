# encoding: utf-8

a = Car.new; a.engine = :disel; a.size = 1.6
a.engine #=> disel
a.size #=>1.6
a.engine_info #=>"1.6 disel engine"
Car.new(:engine => :gas, :size => 1.6).engine_info#=> 1.6 gas engine
Car.new.engine_info #=> should fail
Car.new(asdasd: true) #=>should fail
Car.new(engine: :disel, size: 2, turbo: true).engine_info # => "Turbo disel engine 2.0"
a = Car.new do 
	self.engine= :disel
	self.size= 3
end
a = Car.new do
	engine :diesel
	size 3
end
a.engine_info	#=> "3.0 disel engine"