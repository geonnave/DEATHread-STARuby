require 'rubygems'
require 'shoes'

require 'spaceships/spaceship'
require 'spaceships/death_star'

Shoes.app :width => 255, :height => 255, :title => 'DEATHread STARuby' do

	def draw
		background "../images/panel_on.png"
		animate(2) do |i|
			if i == 1
				background "../images/panel_on_jedi_attack.png"
			else
				background "../images/panel_on.png"
			end
		end
	end

	death_star = DeathStar.new

	click do |button, x, y|
		draw
	end
	
	
end
