# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'spaceship_modules/spaceship_module'

class DefenseModule< SpaceshipModule

  def initialize energy=-100, fuel=-50, damages=0
		super(energy,fuel,damages)
  end

end
