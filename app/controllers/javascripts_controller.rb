class JavascriptsController < ApplicationController
  def dynamic_clues
     @current_selected_clues = Clue.all
  end
end
