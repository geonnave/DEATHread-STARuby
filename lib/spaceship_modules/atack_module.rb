require './spaceship_modules/spaceship_module'

class AtackModule < SpaceshipModule
  def initialize energy=-150, fuel=-50, damages=0
		super(energy,fuel,damages)
  end
end
