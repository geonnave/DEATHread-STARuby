require 'rubygems'
require 'shoes'

Shoes.app :width => 255, :height => 255, :title => 'DEATHread STARuby', :resizable => false do

	def draw

		background "../../images/panel_on_jedi_attack.png"
		animate(2) do |i|
			if i == 1
#				clear
				background "../../images/panel_on_jedi_attack.png"
			else
#				clear
				background "../../images/panel_on.png"
			end
		end

	end

	spaceship = DeathStar.new
	
	click do |button, x, y|
		
		draw
	end
end
