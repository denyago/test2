# encoding: utf-8
class Car

  VALID_ATTR = [:engine, :size, :turbo]

  attr_accessor *VALID_ATTR

  def initialize(opt={})
    if block_given?

    else
      _opt_init(opt)
    end
  end

  def engine_info
    if @engine == "" || @size == ""
      raise "Not enough parameters"
    end
    if (@turbo)
      "Turbo " + @engine.to_s + " engine " + @size.to_s
    else
      @size.to_s + " " + @engine.to_s.capitalize + " engine"
    end
  end

  private
    def _opt_init(opt)
      opt.each_with_index do |(attr,val),index|
        if VALID_ATTR.include? attr
          send("#{attr}=", val)
        else
          raise "Attribute " + attr.to_s + " doesn't support"
        end
      end
    end

  def _block_init(func)

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
a.engine_info	#=> "3.0 disel engine"
a = Car.new do
  engine :diesel
	size 3
end
