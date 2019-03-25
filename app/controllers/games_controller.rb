require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
    @letters
  end

  def score
    @word = params[:input].upcase.split('')
    @letters = params[:letters].upcase.split(' ')
    # raise

    url = "https://wagon-dictionary.herokuapp.com/#{@word.join}"
    attempt = open(url).read
    check = JSON.parse(attempt)

    all_in = @word.uniq.all? { |l| @letters.count(l) >= @word.count(l) }

    if all_in == false
      @message = 'not in the grid'
    elsif check['found'] == false
      @message = 'not an English word'
    else
      @message = "congratulations! #{@word} is an English word"
    end
    # score = @word.length - (end_time - start_time)

    # { score: score, message: 'well done!' }
  end
end
