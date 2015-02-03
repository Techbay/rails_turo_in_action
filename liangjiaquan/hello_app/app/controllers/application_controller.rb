class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def hello
    # practice1: print non-ASCII char
    render text: "┍hello, world!"
  end
  
  # practice2: add goodbye action
  def goodbye
    render text: "goodbye, world"
  end
end
