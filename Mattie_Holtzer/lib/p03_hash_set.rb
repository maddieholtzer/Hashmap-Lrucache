require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count+=1
    if @count>num_buckets
      resize!
    end
    @store[key.hash%num_buckets].push(key)
  end

  def include?(key)
    @store[key.hash%num_buckets].include?(key)
  end

  def remove(key)
    if include?(key)
      @count-=1
      @store[key.hash%num_buckets].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
