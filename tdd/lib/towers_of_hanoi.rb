class Tower
attr_accessor :stack

  def initialize(stack = [])
    @stack = stack
  end

  def move(tower)
    unless tower.stack.last.nil? || @stack.last.nil?
      raise StandardError if tower.stack.last < @stack.last
    end
    tower.stack << @stack.pop
  end

end



class Game
  def initialize
    @tower1 = Tower.new([3, 2, 1])
    @tower2 = Tower.new
    @tower3 = Tower.new
  end

  def won?
    @tower2.length == 3 || @tower3.length == 3
  end
end
