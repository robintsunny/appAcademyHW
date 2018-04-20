class Stack

  def initialize
    @ivar = []
  end

  def add(el)
    @ivar.push(el)
  end

  def remove
    @ivar.pop
  end

  def show
    @ivar
  end
end

class Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.push(el)
  end

  def dequeue
    @ivar.shift
  end

  def show
    @ivar
  end

end


class Map
  def initialize
    @ivar = []
  end


  def assign(k,v)
    if key_exists?(k)
      @ivar.each do |el|
        if el[0] == k
          el[1] = v
        end
      end
    else
      @ivar << [k,v]
    end
    @ivar
  end


  def lookup(k)
    return "no key exists" if key_exists?(k) == false

    @ivar.each_with_index do |el,i|
      return el[1] if el[0] == k
    end
    @ivar
  end


  def key_exists?(k)
    @ivar.each do |el|
      return true if el[0] == k
    end
    false
  end


  def remove(k)
    return "no changes made" if key_exists?(k) == false

    @ivar.each_with_index do |el,i|
      @ivar.delete_at(i) if el[0] == k
    end
    @ivar
  end



  def show
    @ivar
  end

end
