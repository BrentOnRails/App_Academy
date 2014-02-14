def correct_hash(hash)
  correct = {}
  hash.each do |k,v|
    correct[v[0].to_sym] = v
  end
  correct
end

wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }
p correct_hash(wrong_hash)