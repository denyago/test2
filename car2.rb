# encoding: utf-8

class Car
  ALLOWED = [:engine, :size, :turbo]

  def initialize(args = {}, &block)
    if block_given?
      instance_eval &block
    else
      args.each { |k, v| ALLOWED.include?(k) ? instance_variable_set("@#{k}", v) : raise("the variable '@#{k}' is not allowed") }
    end
  end

  def method_missing name, *args, &block
    name = name.to_s
    name.chop! if name =~ /=$/
    if ALLOWED.include? name.to_sym
      self.class.send(:define_method, name, proc { attr_accessor name.to_sym} )
      instance_variable_set("@#{name}", args[0])
    else
      super
    end
  end

  def engine_info
    puts "#{'Turbo ' if @turbo}#{@size.to_f} #{@engine} engine".capitalize
  end
end


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