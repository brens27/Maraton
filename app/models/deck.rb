class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
end
