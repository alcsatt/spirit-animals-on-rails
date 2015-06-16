module ApplicationHelper

  def current_card
    @game.deck.cards[@game.card_idx]
  end

  def shuffle_answer_choices(answer=nil)
    @cards = [card_behavior_shuffle(answer), card_behavior_shuffle(answer), @card.answer ].shuffle
  end

  def card_behavior_shuffle(answer=nil)
    ([CardBehavior.all.shuffle] - [answer]).flatten.first.name
  end

  def set_curr_card_letters_btn_types
    @card = current_card
    @letters = @game.set_letters
    @btn_types = @game.set_btn_types
  end

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

end
