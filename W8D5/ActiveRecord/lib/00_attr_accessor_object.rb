class AttrAccessorObject
  def self.my_attr_accessor(*names) # cat.color
      # ...
      names.each do |name|
        define_method(name) do
          self.instance_variable_get("@#{name}") 
        end
      end
      
      names.each do |name|
        define_method("#{name}=") do |val|
          self.instance_variable_set("@#{name}", val)        
        end
      end
  end
end
