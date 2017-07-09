class TabiController < ApplicationController
	def index
	  @tabi_props = { name: "Stranger" }
	  logger.debug "This is from debug#{@tabi_props}"
	end
end
