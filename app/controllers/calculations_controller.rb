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

def flex_payment
@apr = params[:apr].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    @percent_apr=@apr*0.01
    monthly_rate=@percent_apr/1200
    number_of_payments=@years*12

    payment=(monthly_rate)/(1-(1+monthly_rate)**-number_of_payments)

    @monthly_payment = payment*@principal
    render("flex_payment.html.erb")
end

def random_number
  @min = params["min"].to_f
  @max = params["max"].to_f
  @range = @max - @min
  @rand = rand(@range)
  @random = @min + @rand
  render("random_number.html.erb")
end

def payment_form
render("calculations/payment_form.html.erb")
end

def payment
  @apr = params[:apr].to_f
      @years = params[:years].to_i
      @principal = params[:principal].to_f

      monthly_rate=@apr/1200
      number_of_payments=@years*12

      payment=(monthly_rate)/(1-(1+monthly_rate)**-number_of_payments)

      @monthly_payment = payment*@principal
      render("calculations/payment.html.erb")
end

def random_form
  render("calculations/random_form.html.erb")
  #code
end

def random
  @min = params[:minimum].to_f
  @max = params[:maximum].to_f
  @range = @max - @min
  @rand = rand(@range)
  @random = @min + @rand
  render("calculations/random.html.erb")
end

def word_count_form
render("calculations/word_count_form.html.erb")
end

def word_count
  @text = params[:user_text]
      @special_word = params[:special]

      text_split_into_array = @text.split

    @word_count = text_split_into_array.length

    text_into_characters_with_spaces = @text.split("")

    @character_count_with_spaces = text_into_characters_with_spaces.length

    text_into_characters = @text.gsub(/\s+/, "")

    @character_count_without_spaces = text_into_characters.length

    lowercase_text=@text.downcase

    special_text=lowercase_text.gsub(/[^a-z0-9\s]/i, "")

    special_word_text = special_text.split

    @occurrences = special_word_text.count{|x| x==@special_word}

    render("calculations/word_count.html.erb")
end

def descriptive_stats_form
render("calculations/descriptive_stats_form.html.erb")
end

def descriptive_stats
  @numbers = params[:numbers].gsub(',', '').split.map(&:to_f)

      # ================================================================================
      # Your code goes below.
      # The numbers the user input are in the array @numbers.
      # ================================================================================


      @sorted_numbers = @numbers.sort

      @count = @numbers.count

      @minimum = @numbers.min

      @maximum = @numbers.max

      @range = @numbers.max - @numbers.min

      def median
        sorted = @numbers.sort
        len = sorted.length
        (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
      end

      @median = median

      @sum = @numbers.sum

      sum_number=@numbers.sum
      number_total=@numbers.count

      @mean = sum_number/number_total

      def var
        m=@mean
        @numbers.sum{|i| (i-m)**2} /@numbers.size
      end

      @variance = var

      def dev
        m=@mean
        p=@numbers.sum{|i| (i-m)**2} /@numbers.size
        Math.sqrt(p)
      end

      @standard_deviation = dev

      frequency = @numbers.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

      @mode = @numbers.max_by { |v| frequency[v] }


      # ================================================================================
      # Your code goes above.
      # ================================================================================

      render("descriptive_stats.html.erb")
    end

end
