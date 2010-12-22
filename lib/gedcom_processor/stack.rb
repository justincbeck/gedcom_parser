module GedcomProcessor
  class Stack
    def initialize
      @stack = []
    end
    
    def push(item)
      @stack[@stack.length] = item
    end
    
    def pop
      @stack.delete(@stack.last)
    end
    
    def peek
      @stack.last
    end
    
    def count
      @stack.length
    end
  end
end