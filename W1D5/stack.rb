require_relative 'array_extension.rb'

class Stack
  def initialize(array = [])
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    self.new(@stack.deep_dup)
  end
end
