class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    ret = ""
    each do |item|
      ret+=(item.hash%1000).to_s
    end
    ret.to_i
  end
end

class String
  def hash
    ret = ""
    chars.each do |letter|
      ret+=letter.ord.to_s
    end
    ret.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ret = 0
    each do |key, val|
      temp = ""
      temp+=(key.hash%1000).to_s
      temp+=(val.hash%1000).to_s
      ret+=temp.to_i
    end
    ret
  end
end
