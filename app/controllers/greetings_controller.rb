class GreetingsController < ApplicationController
	before_filter :store_location, only: :hello
  def hello
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def cookie
  end

  def advertising
  end

  def developers
  end

  def help
  end

  def contact
  end
end
