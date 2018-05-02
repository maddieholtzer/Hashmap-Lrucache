require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
    @length = 0
  end

  def count
    @map.count
  end

  def get(key)
    if @store.include?(key)
      ret = @store.get(key)
      @store.remove(key)
      @store.append(key, ret)
      return ret
    end
    if @length==@max
      eject!
    end
    @length+=1
    val = @prc.call(key)
    @store.append(key,val)
    return val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    @length-=1
    @store.remove(@store.first.key)
  end
end
