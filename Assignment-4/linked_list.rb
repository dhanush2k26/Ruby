module LinkedListMethods
  # Simple singly linked list implementation with common methods:
  # - push(value) / append(value): add to tail
  # - unshift(value) / prepend(value): add to head
  # - insert_at(index, value): insert at index (0-based)
  # - pop: remove and return tail value
  # - shift: remove and return head value
  # - delete(value): delete nodes with value (returns list of deleted values or nil)
  # - delete_at(index): delete node at index and return its value
  # - each: iterate over values (Enumerable)
  # - size: current number of elements
  # - to_a: return array of values
  class Node
    attr_accessor :value, :next
    def initialize(value, nxt = nil)
      @value = value
      @next = nxt
    end
  end

  class LinkedList
    include Enumerable

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    def push(value)
      node = Node.new(value)
      if @head.nil?
        @head = @tail = node
      else
        @tail.next = node
        @tail = node
      end
      @size += 1
      self
    end

    alias_method :append, :push

    def unshift(value)
      node = Node.new(value, @head)
      @head = node
      @tail = node if @tail.nil?
      @size += 1
      self
    end

    alias_method :prepend, :unshift

    # Insert as the first element (alias to unshift)
    def insert_first(value)
      unshift(value)
    end

    # Insert as the last element (alias to push)
    def insert_last(value)
      push(value)
    end

    def insert_at(index, value)
      raise IndexError, "index out of bounds" if index < 0 || index > @size
      return unshift(value) if index == 0
      return push(value) if index == @size

      prev = nil
      cur = @head
      i = 0
      while i < index
        prev = cur
        cur = cur.next
        i += 1
      end
      node = Node.new(value, cur)
      prev.next = node
      @size += 1
      self
    end

    # Insert new value before the first occurrence of target
    # Returns self on success, nil if target not found
    def insert_before(target, value)
      return insert_first(value) if @head && @head.value == target
      prev = nil
      cur = @head
      while cur && cur.value != target
        prev = cur
        cur = cur.next
      end
      return nil unless cur
      node = Node.new(value, cur)
      prev.next = node
      @size += 1
      self
    end

    # Insert new value after the first occurrence of target
    # Returns self on success, nil if target not found
    def insert_after(target, value)
      cur = @head
      while cur && cur.value != target
        cur = cur.next
      end
      return nil unless cur
      return push(value) if cur == @tail
      node = Node.new(value, cur.next)
      cur.next = node
      @size += 1
      self
    end

    def pop
      return nil if @head.nil?
      if @head == @tail
        value = @head.value
        @head = @tail = nil
        @size = 0
        return value
      end
      cur = @head
      while cur.next && cur.next != @tail
        cur = cur.next
      end
      value = @tail.value
      cur.next = nil
      @tail = cur
      @size -= 1
      value
    end

    def shift
      return nil if @head.nil?
      value = @head.value
      @head = @head.next
      @tail = nil if @head.nil?
      @size -= 1
      value
    end

    def delete(value)
      return nil if @head.nil?
      deleted = []
      while @head && @head.value == value
        deleted << @head.value
        @head = @head.next
        @size -= 1
      end
      cur = @head
      while cur && cur.next
        if cur.next.value == value
          deleted << cur.next.value
          cur.next = cur.next.next
          @size -= 1
        else
          cur = cur.next
        end
      end
      @tail = cur if cur
      deleted.empty? ? nil : deleted
    end

    def delete_at(index)
      raise IndexError, "index out of bounds" if index < 0 || index >= @size
      return shift if index == 0
      prev = nil
      cur = @head
      i = 0
      while i < index
        prev = cur
        cur = cur.next
        i += 1
      end
      prev.next = cur.next
      @tail = prev if prev.next.nil?
      @size -= 1
      cur.value
    end

    def each
      cur = @head
      while cur
        yield cur.value
        cur = cur.next
      end
      self
    end

    def size
      @size
    end

    def to_a
      arr = []
      each { |v| arr << v }
      arr
    end

    # Iterate values starting from a 0-based index
    def each_from(index)
      return enum_for(:each_from, index) unless block_given?
      raise IndexError, "index out of bounds" if index < 0 || index >= @size
      cur = @head
      i = 0
      while i < index
        cur = cur.next
        i += 1
      end
      while cur
        yield cur.value
        cur = cur.next
      end
      self
    end

    def to_s
      to_a.join(" -> ")
    end

    # Return first element (value) or nil
    def first
      @head&.value
    end

    # Return last element (value) or nil
    def last
      @tail&.value
    end

    # Returns true if value is present in list
    def include?(value)
      each { |v| return true if v == value }
      false
    end

    # Return index of first occurrence of value, or nil
    def index(value)
      i = 0
      each do |v|
        return i if v == value
        i += 1
      end
      nil
    end

    # Array style access: list[index]
    def [](index)
      raise IndexError, "index out of bounds" if index < 0 || index >= @size
      cur = @head
      i = 0
      while i < index
        cur = cur.next
        i += 1
      end
      cur.value
    end

    # Array style assignment: list[index] = value
    def []=(index, value)
      raise IndexError, "index out of bounds" if index < 0 || index >= @size
      cur = @head
      i = 0
      while i < index
        cur = cur.next
        i += 1
      end
      cur.value = value
    end

    # Return a new LinkedList with reversed order
    def reverse
      rev = LinkedList.new
      each { |v| rev.unshift(v) }
      rev
    end

    # Reverse list in place
    def reverse!
      prev = nil
      cur = @head
      @tail = @head
      while cur
        nxt = cur.next
        cur.next = prev
        prev = cur
        cur = nxt
      end
      @head = prev
      self
    end

    # Clear the list
    def clear
      @head = @tail = nil
      @size = 0
      self
    end

    # Return true if empty
    def empty?
      @size == 0
    end

    # Append another enumerable (Array, LinkedList, etc.) to this list
    def concat(other)
      if other.nil?
        self
      else
        other.each { |v| push(v) }
        self
      end
    end

    # Return a shallow duplicate of the list (values copied into new nodes)
    def dup
      new_list = LinkedList.new
      each { |v| new_list.push(v) }
      new_list
    end

    # Equality comparison: compare as arrays of values
    def ==(other)
      return false unless other.respond_to?(:to_a)
      to_a == other.to_a
    end

    # Inspect representation (human-friendly)
    def inspect
      to_s
    end

    # Return a LinkedList of mapped values (non-destructive)
    def map_to_list
      return enum_for(:map_to_list) unless block_given?
      LinkedList.new.tap { |l| each { |v| l.push(yield(v)) } }
    end

    # Return a LinkedList filtered by block (non-destructive)
    def select_to_list
      return enum_for(:select_to_list) unless block_given?
      LinkedList.new.tap { |l| each { |v| l.push(v) if yield(v) } }
    end
  end
end

# Make class available as LinkedList as expected by the runner
LinkedList = LinkedListMethods::LinkedList unless defined?(LinkedList)
