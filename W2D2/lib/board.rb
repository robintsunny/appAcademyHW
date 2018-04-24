class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    self.place_stones
  end

  def place_stones
    @cups.map!.with_index do |cup,i|
      if i != 6 && i != 13
        [:stone,:stone,:stone,:stone]
      else
        []
      end
    end
  end

  def valid_move?(start_pos)
    if @cups[start_pos] == []
      raise "Invalid starting cup"
    elsif start_pos.between?(0,5) == false
      raise "Invalid starting cup"
    elsif start_pos.between?(7,12) == false
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos

    until stones.empty?
      cup_idx += 1
      cup_idx = (cup_idx % 14)
      if cup_idx == 6
        @cups[cup_idx] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[cup_idx] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.empty?}
    return true if @cups[7..12].all? {|cup| cup.empty?}
    false
  end

  def winner
    player1_score = @cups[6].length
    player2_score = @cups[13].length

    relative_score = player1_score <=> player2_score
    if relative_score == -1
      @name2
    elsif relative_score == 0
      :draw
    elsif relative_score == 1
      @name1
    end
  end
end
