require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash = Hash.new(0)
  string.split("").each do |letter|
    hash[letter]= hash[letter]+1
  end
  odds = 0
  hash.each do |key, val|
    if val%2!=0
      odds+=1
      return false if odds>1
    end
  end
  true
end
