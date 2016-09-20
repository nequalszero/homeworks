class OutOfBoundsError < StandardError
end

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new()}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index { |_, idx| @cups[idx] = [:stone]*4 unless idx == 6 || idx == 13}
  end

  def valid_move?(start_pos)
    raise OutOfBoundsError.new("Invalid starting cup") unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    @current_player_name = current_player_name
    skip_idx = current_player_name == @name1 ? 13 : 6
    starting_stones = @cups[start_pos].dup
    @cups[start_pos] = []

    until starting_stones.empty?
      start_pos += 1
      start_pos = (start_pos % 13)-1 if start_pos > 13
      next if start_pos == skip_idx

      @cups[start_pos] << starting_stones.pop
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    player_store = @current_player_name == @name1 ? 6 : 13
    if @cups[ending_cup_idx].length == 1 && ending_cup_idx != player_store
      return :switch
    elsif ending_cup_idx == player_store
      return :prompt
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    cups[6].length > cups[13].length ? @name1 : @name2
  end
end
