class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :top

  def initialize
    @top = nil
  end

  def push(number)
    @top = Node.new(number, @top)
  end

  def pop
    if @top == nil
      return nil
    end

    node_value = @top.value
    @top = @top.next_node
    
    return node_value
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  reversed_stack = Stack.new
  
  while list != nil
    reversed_stack.push(list)
    list = list.next_node
  end

  new_list = nil
  new_value = reversed_stack.pop

  while new_value != nil
    if new_list == nil
      new_list = new_value
    else
      last_node = new_list
      while last_node.next_node != nil
        last_node = last_node.next_node
      end
      last_node.next_node = new_value
      new_value.next_node = nil
    end
    new_value = reversed_stack.pop
  end

  return new_list
end

node1 = Node.new(37)
node2 = Node.new(99, node1)
node3 = Node.new(12, node2)

print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)