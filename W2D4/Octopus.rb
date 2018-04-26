def sluggish(arr)
  biggest_fish = ""
  arr.each do |fish1|
    arr.each do |fish2|
      if fish1.length > fish2.length
        biggest_fish = fish1 if fish1.length > biggest_fish.length
      end
    end
  end
  biggest_fish
end

a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case_value = prc.call(left.first, right.first)
      if case_value == -1
        merged << left.shift
      elsif case_value == 0
        merged << left.shift
      elsif case_value == 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant(arr)
  prc = Proc.new{|x,y| y.length <=> x.length}
  arr.merge_sort(&prc).first
end

def clever(arr)
  biggest_fish = ""

  arr.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end
  biggest_fish
end


def slow_dance(dir,tiles)
  tiles.each_with_index do |tile,i|
    if dir == tile
      return idea
    end
  end
  nil
end



def fast_dance(direction)
  tiles_hash = {
      "up" => 0,
      "right-up" => 1,
      "right"=> 2,
      "right-down" => 3,
      "down" => 4,
      "left-down" => 5,
      "left" => 6,
      "left-up" => 7}

  tiles_hash[direction]
end
