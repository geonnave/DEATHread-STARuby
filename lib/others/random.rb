require './others/disaster'
require './others/event'

class Random
  def disaster_from_random
    name = $DISASTERS_NAMES[Random.rand($DISASTERS_NAMES.size)]
    damage = Random.rand(9) +1
    Disaster.new(name,damage)
  end
  
  def event_from_random
    name = $EVENTS_NAMES[Random.rand($EVENTS_NAMES.size)]
    bonus = Random.rand(9) +1
    Event.new(name,bonus)
  end
end
