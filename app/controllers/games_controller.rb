class GamesController < ApplicationController
 def score
  @word = params[:word]
 end

 def new
  @letters = Array.new(10) { ('A'..'Z').to_a.sample }
 end
end
