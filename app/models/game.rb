class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  def self.current_game_by_id(id)
    self.find(id)
  end

  def has_next_round?
    self.card_idx == self.deck.cards.length
  end

  def log_correct_answer!
    self.card_idx += 1
    self.right += 1
    self.save
    ["Correct!"]
  end

  def log_wrong_answer!
    self.wrong += 1
    self.save
    ["Incorrect. Try again."]
  end

  def set_letters
    ["A", "B", "C"]
  end

  def set_btn_types
    ["primary", "success", "warning"]
  end
end
