class GameController < ApplicationController

  def create
    @deck = Deck.find(params[:deck_id])
    @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])
    redirect_to "/game/#{@game.id}"
  end

  def show
    @game = Game.find(params[:id])
    @user = current_user
    set_curr_card_letters_btn_types
    shuffle_answer_choices(@card.answer)
  end

  def update
    @game = Game.find(params[:id])
    @card = current_card
    if params[:selection] == @card.answer
      @messages = @game.log_correct_answer!
      # @game.save
      if @game.has_next_round?
        redirect_to root_path and return
      end
    else
      @messages = @game.log_wrong_answer!
      # @game.save
    end
    set_curr_card_letters_btn_types
    shuffle_answer_choices
    redirect_to game_path
  end
end
