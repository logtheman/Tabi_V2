class TabiController < ApplicationController
	layout "tabi"

	def index
	  @tabi_props = { name: "Stranger" }
	end
end
