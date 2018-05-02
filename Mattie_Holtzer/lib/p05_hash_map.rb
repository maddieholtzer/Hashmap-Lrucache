require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash%num_buckets].include?(key)
  end

  def set(key, val)
    if include?(key)
      @store[key.hash%num_buckets].update(key,val)
    else
      @count+=1
      if @count>num_buckets
        resize!
      end
      @store[key.hash%num_buckets].append(key, val)
    end
  end

  def get(key)
    @store[key.hash%num_buckets].get(key)
  end

  def delete(key)
    if include?(key)
      @count-=1
      @store[key.hash%num_buckets].remove(key)
    end
  end

  def each
    @store.each do |llist|
      llist.each do |node|
        yield [node.key,node.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets*2) { LinkedList.new }
    @store.each do |arr|
      arr.each do |node|
        new_arr[node.key.hash%(num_buckets*2)].append(node.key, node.val)
      end
    end
    @store = new_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
