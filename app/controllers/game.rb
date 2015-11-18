# get '/game' do 

# 	erb :game
# end

get '/show_game/:id' do
	deck_id = params[:id]
	@deck = Deck.find(deck_id)
	@cards = @deck.cards
	erb :game
end

post '/results/:id' do 
	deck_id = params[:id]
	@deck = Deck.find(deck_id)

	@cards = @deck.cards

	result = params[:user_answer]
	p result
	p params
	@correct = 0
	@incorrect = 0
	
	result.each_with_index do |a, i|
		if a == @cards[i].answer
			@correct += 1
		else
			@incorrect += 1
		end
	end

	erb :show_results
end