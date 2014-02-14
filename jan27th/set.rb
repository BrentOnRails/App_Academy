

def set_add_el(set, element)
  set[element] = true
  set
end

def set_remove_el(set, element)
  set.delete(element)
  set
end

def set_list_els(set)
  set.keys
end

def set_member?(set, element)
  set.include? element
end

def set_union(set1, set2)
  set1.merge(set2)
end

def set_intersection(set1, set2)
  hash = {}
  set1.each do |k, v|
    if set2.include? k
      hash[k] = v
    end
  end
  hash
end

def set_minus(set1, set2)
  hash = {}
  set1.each do |k, v|
    hash[k] = v unless set2.include?(k)
  end
  hash
end



p set_add_el({}, :x) # => make this return {:x => true}
p set_add_el({:x => true}, :x) # => {:x => true} # This should automatically work if the first method worked
p set_remove_el({:x => true}, :x) # => {}
p set_list_els({:x => true, :y => true}) # => [:x, :y]
p set_member?({:x => true}, :x) # => true
p set_union({:x => true}, {:y => true}) # => {:x => true, :y => true}
p set_intersection({x: true, y: true}, {z: true}) # I'm not going to tell you how the last two work
p set_minus({x: true, y: true}, {y: true, z: true})