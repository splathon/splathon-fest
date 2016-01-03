class FestsController < ApplicationController
  def index
    @fests = Fest.all
  end
end
