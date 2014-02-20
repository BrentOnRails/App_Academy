class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) { instance_variable_get("@#{name}")}
      define_method("#{name}=") { |param| instance_variable_set("@#{name}", param)}
    end
  end
end
