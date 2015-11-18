# before '/secret' do
# 	if session[:user_if] != nil
# 		erb :online
# 	else
# 		redirect('/')
# 	end
# end

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/login' do
	@user = User.all
	@deck = Deck.all
	@registration = User.find(session[:user_id])
	erb :user_home
end

post '/login' do
	@deck = Deck.all
	user_email = params[:user_email]
	user_password = params[:user_password]
	@registration = User.authenticate(user_email, user_password)
	if @registration == nil
		redirect ('/')
	end
	session[:user_id] = @registration.id
	erb :user_home
end

post '/registration' do
	@deck = Deck.all

	user_name = params[:name]
	user_email = params[:email]
	user_password = params[:password]
	p params
	@registration = User.new(name: user_name, email: user_email, password: user_password)
	if @registration.save
		session[:user_id] = @registration.id
		erb :user_home
	else
		redirect '/registration'
	end
end

get '/registration' do

	erb :registration
end

get '/create_deck' do
	erb :create_deck
end

post '/create_deck' do
	deck_name  = params[:name]
	question_1 = params[:question_1]
	answer_1   = params[:answer_1]
	question_2 = params[:question_2]
	answer_2   = params[:answer_2]
	question_3 = params[:question_3]
	answer_3   = params[:answer_3]
	question_4 = params[:question_4]
	answer_4   = params[:answer_4]
	question_5 = params[:question_5]
	answer_5   = params[:answer_5]
	

	card01 = Card.new(question: question_1, answer: answer_1)
	card01.save	
	card02 = Card.new(question: question_2, answer: answer_2)
	card02.save
	card03 = Card.new(question: question_3, answer: answer_3)
	card03.save
	card04 = Card.new(question: question_4, answer: answer_4)
	card04.save
	card05 = Card.new(question: question_5, answer: answer_5)
	card05.save

	@deck = Deck.new(name: deck_name)
	@deck.save

	@deck.cards << card01 << card02 << card03 << card04 << card05
	@deck.save

	erb :new_deck 
end

get '/logout' do 
	session.clear
	redirect '/'
end