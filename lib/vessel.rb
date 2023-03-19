class Vessel
  attr_reader :volume, :name

  def initialize(name, volume)
    @name = name
    @volume = volume
    @level = 0
  end

  def empty?
    return @level == 0
  end

  def fill(v=volume)
    total = v + @level
    if total <= volume
      @level += v  
    else
      @level = volume
    end
  end

end
