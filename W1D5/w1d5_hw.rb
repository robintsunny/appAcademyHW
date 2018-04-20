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
