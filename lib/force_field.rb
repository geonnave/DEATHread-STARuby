
class ForceField < Thread
  def initialize
    @active = false
  end

	def activate
		@active = true
	end

	def active?
		@active
	end
end
