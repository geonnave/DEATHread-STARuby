
class Disaster
  attr_reader :DISASTERS_NAMES
  $DISASTERS_NAMES =["PIRATE ATACK","METEOR SHOWER","ALIEN ATTACK"]
  
  attr_accessor :name, :damage
  def initialize name, damage
    @name = name
    @damage = damage
  end

  
  def to_s
    "#{@name} Damage: #{@damage}\n"
  end
end
