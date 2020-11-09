require 'open-uri'
require 'json'

class GamesController < ApplicationController
 def score
  @word = params[:word]
  @grid = params[:letters]

  if included?(@word) == false
   @answer = "Sorry but #{@word.upcase} can't be built out of #{@grid}"
  elsif english?(@word) == false
   @anser = "Sorry but #{@word.upcase} does not seem to be an english word"
  elsif included?(@word) == true && english?(@word) == true
   @answer = "Congratulations you earn #{@word.length*10} points, #{@word.upcase} is a valid english word"
  end
 end

 def included?(guess)
  guess.chars.all? { |letter| guess.count(letter) <= @grid.downcase.count(letter) }  
 end

 # def score(guess)
 #  return "#{guess.length*10}"
 # end

 def english?(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
  json = JSON.parse(response.read)
  return json['found']
end
 def new
  @letters = Array.new(10) { ('A'..'Z').to_a.sample }
 end

end
