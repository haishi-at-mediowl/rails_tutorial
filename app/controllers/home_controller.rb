class HomeController < ApplicationController
  def index
    @current = Todo.latest(current_user) if user_signed_in?
  end
end
