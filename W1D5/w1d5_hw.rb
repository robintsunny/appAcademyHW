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
