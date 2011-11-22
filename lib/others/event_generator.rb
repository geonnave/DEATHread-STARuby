require './others/random'

class EventGenerator
  attr_accessor :events, :disasters
  def initialize
    @events = Array.new
    @disasters = Array.new
    @random = Random.new
  end
  
  def generate_disaster
    @disasters << @random.disaster_from_random
  end
  
  def generate_event
    @events << @random.event_from_random
  end
	def delete_event event_index
    @events.delete(event_index)
  end
    
  def combat disaster_index,defense,atack
		unless @disasters[disaster_index] == "METEOR SHOWER"
			disaster = @disasters[disaster_index]
			if disaster.damage >= 8
				disaster.damage+= defense + 2*atack
			elsif disaster.damage < 3
				disaster.damage+= defense + 0.5*atack
    
			else
				disaster.damage+= defense + atack
			end
			if
				disaster.damage <= 0
				@disasters.delete(disaster)
			end
		end
  end
  
end
