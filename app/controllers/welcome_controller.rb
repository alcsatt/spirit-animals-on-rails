class WelcomeController < ApplicationController

  def index
    @user = current_user
    @decks = DefaultDeck.all
    @cards_to_display = Card.all.first(3)
  end

end
