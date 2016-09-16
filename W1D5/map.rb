require_relative 'array_extension.rb'

# assign(key, value), lookup(key), remove(key), show

class Map
  def initialize(array = [])
    @map = []
  end

  def assign(key, value)
    existing_idx = lookup(key)
    if existing_idx.nil?
      @map << [key, value]
    else
      @map[existing_idx][1] = value
    end
  end

  def lookup(key)
    @map.find_index { |arr| arr[0] == key }
  end

  def show
    self.new(@map.deep_dup)
  end
end
