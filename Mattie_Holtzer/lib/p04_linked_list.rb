class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @first = Node.new()
    @last = @first
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @first.next
  end

  def last
    @last
  end

  def empty?
    !@first.next
  end

  def get(key)
    current = first
    while !!current
      if current.key == key
        return current.val
        break
      end
      current = current.next
    end
  end

  def include?(key)
    current = first
    while !!current
      if current.key.equal?(key)
        return true
      end
      current = current.next
    end
    false
  end

  def append(key, val)
    nextnode = Node.new(key,val)
    nextnode.prev = last
    last.next = nextnode
    @last = nextnode
  end

  def update(key, val)
    current = first
    while !!current
      if current.key.equal?(key)
        current.val = val
        break
      end
      current = current.next
    end
  end

  def remove(key)
    current = first
    while !!current
      if current.key.equal?(key)
        prevnode = current.prev
        nextnode = current.next
        prevnode.next = nextnode
        if !!nextnode
          nextnode.prev = prevnode
        end
        break
      end
      current = current.next
    end
  end

  def each
    ret = []
    current = first
    while !!current
      yield current
      current = current.next
    end
    ret
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
