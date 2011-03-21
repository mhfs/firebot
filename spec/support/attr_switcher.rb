def swap(object, attrs = {})
  old_values = {}
  attrs.each do |key, value|
    old_values[key] = object.send key
    object.send "#{key}=", value
  end
  yield
ensure
  old_values.each do |key, value|
    object.send :"#{key}=", value
  end
end
