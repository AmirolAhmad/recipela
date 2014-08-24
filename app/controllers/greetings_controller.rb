class GreetingsController < ApplicationController
	before_filter :store_location, only: :hello
  def hello
  end
end
