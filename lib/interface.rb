require 'rubygems'
require 'shoes'

require 'spaceships/spaceship'
require 'spaceships/death_star'

Shoes.app :width => 512, :height => 512, :title => 'DEATHread STARuby' do
	ON_OFF_POS = [[464, 398],[506, 444]]	#[min x, min y], [max x, max y]
	TOP_MAIN = 194
	BASE_MAIN = 386
	WIDTH_MAIN = 65
	LEFT_DAMAGE, LEFT_FUEL, LEFT_ENERGY = 300, 370, 440
	@energy_spent = 10
	@fuel_spent = 10
	@damage_spent = 50

	def draw
		if @death_star.active?
			background "../images/panel.jpg"
			render_main_bars
		else
			background "../images/panel_off.jpg"
		end
	end

	def button? x, y, pos=[[0,0],[0,0]]
		x >= pos[0][0] && x <= pos[1][0] &&
			y >= pos[0][1] && y <= pos[1][1]
	end

	def render_main_bars
		fill green
		rect LEFT_DAMAGE, TOP_MAIN+@damage_spent*2, WIDTH_MAIN, BASE_MAIN-(TOP_MAIN+@damage_spent*2)
		rect LEFT_FUEL, TOP_MAIN+@fuel_spent*2, WIDTH_MAIN, BASE_MAIN-(TOP_MAIN+@fuel_spent*2)
		rect LEFT_ENERGY, TOP_MAIN+@energy_spent*2, WIDTH_MAIN, BASE_MAIN-(TOP_MAIN+@energy_spent*2)
	end

	def _click
		click do |button, x, y|
			@death_star.switch if button? x, y, ON_OFF_POS
		end
	end

	def run							#método ainda em desenvolvimento, primeiras tentativas..
		5.times do
			log = @death_star.run
			unless log.nil?
				@sensors = log[0]
#				puts @sensors
				unless @sensors.nil?
					@energy_spent = 200-(@sensors[0])
					@fuel_spent = 200-(@sensors[1])
					@damage_spent = 200-(@sensors[2])
				end
			end
			draw
			sleep($UPDATE_TIME)
		end
	end

	@death_star = DeathStar.new


	draw
	click do |button, x, y|
		puts "[#{x},#{y}]"
		@death_star.switch if button? x, y, ON_OFF_POS
		puts @death_star.active?
		draw
	end
	
	
end
