# encoding: utf-8
class Car
	
	attr_accessor :engine, :size, :turbo || false

	def initialize(opt={})
		opt.each do |attr, val|
			if @engine=="" || @size == ""
				raise "WTF? What do you put there?"
			else
				send("#{attr}=", val)
			end
		end
	end

	def engine
		puts "#{@engine}"
	end
	def size
		puts "#{@size}"
	end


	def engine_info
			if @engine.nil? || @size.nil?
      	raise "Not enough parameters"

 			elsif @turbo == true
 				puts "Turbo #{@engine} #{@size.to_f} #{@turbo}"

      else
	 			puts "#{@size} #{@engine.capitalize} engine #{@turbo}"
	  	end
	end
end


a = Car.new; a.engine = :disel; a.size = 1.7
a.engine #=> disel
a.size #=>1.6
a.engine_info #=>"1.6 Disel engine"
Car.new(:engine => :gas, :size => 1.6).engine_info#=> 1.6 gas engine

#Car.new.engine_info #=> should fail

#Car.new(asdasd: true) #=>should fail

Car.new(engine: :disel, size: 2, turbo: true).engine_info# => "Turbo disel engine 2.0"
=begin
a = Car.new do 
	self.engine= :disel
	self.size= 3
end
=end
#a.engine_info	#=> "3.0 disel engine"
=begin
a = Car.new do
   engine :diesel
   size 3
end
=end