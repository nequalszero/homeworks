class Array
  def deep_dup
      result = []
      self.each do |el|
        if el.is_a?(Array)
          result.push(el.deep_dup)
        else
          result.push(el)
        end
      end
      result
  end
end
