# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'spaceship_modules/spaceship_module'

class AtackModule < SpaceshipModule
  def initialize energy=-150, fuel=-50, damages=0
		super(energy,fuel,damages)
  end
end
