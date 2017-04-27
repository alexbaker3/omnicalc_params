class CalculationsController < ApplicationController

def flex_square_5
@user_number = params["num"].to_f
@square = @user_number **2
end

def flex_square_root
@user_number1 = params["num"].to_f
@square_root = @user_number1 **0.5
end

def square_form
render("calculations/square_form.html.erb")
end

def square
@user_number = params[:user_number].to_f
@square = @user_number**2
render("calculations/square.html.erb")
end

def square_root_form
render("calculations/square_root_form.html.erb")
end

def square_root
@user_number = params[:user_number].to_f
@square = @user_number**0.5
render("calculations/square_root.html.erb")
end

end
