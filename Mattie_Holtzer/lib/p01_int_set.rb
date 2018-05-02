class MaxIntSet

  attr_writer :max, :set

  def initialize(max)
    @max = max
    @set = []
    @max.times do |time|
      @set.push(false)
    end
  end

  def insert(num)
    is_valid?(num)
    @set[num] = true
  end

  def remove(num)
    is_valid?(num)
    @set[num] = false
  end

  def include?(num)
    return false if num<1 || num>@max
    @set[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num<1 || num>@max
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%num_buckets].push(num)
  end

  def remove(num)
    if include?(num)
      @store[num%num_buckets].delete(num)
    end
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @count+=1
    if @count>num_buckets
      resize!
    end
    @store[num%num_buckets].push(num)
  end

  def remove(num)
    if include?(num)
      @count-=1
      @store[num%num_buckets].delete(num)
    end
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets*2)  { Array.new }
    @store.each do |arr|
      arr.each do |num|
        new_arr[num%(num_buckets*2)].push(num)
      end
    end
    @store = new_arr
  end
end
