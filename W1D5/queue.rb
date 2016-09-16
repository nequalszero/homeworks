require_relative 'array_extension.rb'

class Queue
  def initialize(array = [])
    @queue = []
  end

  def add(el)
    @queue << el
  end

  def remove
    @queue.shift
  end

  def show
    self.new(@queue.deep_dup)
  end
end
