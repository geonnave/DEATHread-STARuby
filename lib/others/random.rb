# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'others/disaster'
require 'others/event'

class Random
  def disaster_from_random
    name =$DISASTERS_NAMES[Random.rand($DISASTERS_NAMES.size-1)]
    damage = Random.rand(9) +1
    Disaster.new(name,damage)
  end
  
  def event_from_random
    name =$EVENTS_NAMES[Random.rand($EVENTS_NAMES.size-1)]
    bonus = Random.rand(9) +1
    Event.new(name,bonus)
  end
end
