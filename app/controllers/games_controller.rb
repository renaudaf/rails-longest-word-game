require 'open-uri'
require 'json'

class GamesController < ApplicationController
 def score
  @word = params[:word]
  @grid = params[:letters]
  @first = @word.chars.all? { |letter| @word.count(letter) <= @grid.downcase.count(letter) }

  response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
  json = JSON.parse(response.read)
  @second = json['found']

  if @first == false
   @answer = "Sorry but #{@word.upcase} can't be built out of #{@grid}"
  elsif @second == false
   @anser = "Sorry but #{@word.upcase} does not seem to be an english word"
  elsif @first == true && @second == true
   @answer = "Congratulations, #{@word.upcase} is a valid english word"
  end
 end

 def new
  @letters = Array.new(10) { ('A'..'Z').to_a.sample }
 end

end
