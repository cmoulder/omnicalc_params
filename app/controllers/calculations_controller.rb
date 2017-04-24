class CalculationsController < ApplicationController
  def flex_square
    @user_number = params["num"].to_f
    @square = (@user_number**2).round(2)
    render("calculations/flex_square.html.erb")
  end

  def flex_root
    @user_number = params["num"].to_f
    @square = (@user_number**0.5).round(2)
    render("calculations/flex_root.html.erb")
  end

  def flex_pmt
    @user_apr = params[:int].to_f/100/100
    @user_years = params[:term].to_i
    @user_principal = params[:princip].to_f
    monthly_i = @user_apr/12
    n_month=@user_years*12
    @monthly_payment = @user_principal*(monthly_i*(1 + monthly_i)**n_month)/((1 + monthly_i)**n_month - 1)

    render("calculations/flex_pmt.html.erb")
  end

  def flex_rand
    @user_min = params[:min].to_i
    @user_max = params[:max].to_i
    @rand = Random.new.rand(@user_min..@user_max)
    render("calculations/flex_rand.html.erb")
  end

  def square_form
    @user_number = params["user_number"].to_f
    @square = (@user_number**2).round(2)
    render("calculations/square_form.html.erb")
  end

  def square_results
    @user_number = params[:user_number].to_f
    @square = (@user_number**2).round(2)
    render("calculations/square_results.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root_results
    @user_number = params[:user_number].to_f
    @square_root = (@user_number**0.5).round(3)
    render("calculations/square_root_results.html.erb")
  end

  def pmt_form
    render("calculations/pmt_form.html.erb")
  end

  def pmt_results
    @user_apr = params[:apr].to_f/100
    @user_years = params[:years].to_i
    @user_principal = params[:princip].to_f
    monthly_i = @user_apr/12
    n_month=@user_years*12
    @monthly_payment = @user_principal*(monthly_i*(1 + monthly_i)**n_month)/((1 + monthly_i)**n_month - 1)
    render("calculations/pmt_results.html.erb")
  end

  def rand_form
    render("calculations/rand_form.html.erb")
  end

  def rand_results
    @user_min = params[:min].to_f
    @user_max = params[:max].to_f
    @rand = Random.new.rand(@user_min..@user_max).round(4)
    render("calculations/rand_results.html.erb")
  end

  def word_form
    render("calculations/word_form.html.erb")
  end

  def word_results
    @text = params[:text]
    @special_word = params[:special]

    text_in_array=@text.downcase.split
    @word_count = text_in_array.length
    @character_count_with_spaces = @text.length
    @character_count_without_spaces = text_in_array.join("").length
    no_punctuation = @text.downcase.gsub(/[^a-z0-9\s]/i, '').split
    @occurrences = no_punctuation.count { |x| x == @special_word }
    render("calculations/word_results.html.erb")
  end

  def stats_form
    render("calculations/stats_form.html.erb")
  end

  def stats_results
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)
    sorted_array = @numbers.sort
    @sorted_numbers = sorted_array
    @count = @numbers.length
    min1 = @numbers.min
    @minimum = min1
    max1 = @numbers.max
    @maximum = max1
    @range = max1-min1
    def median(array)
      len = array.length
      (array[(len - 1) / 2] + array[len / 2]) / 2.0
    end
    @median = median(sorted_array)
    @sum = @numbers.sum.to_f
    @mean = @sum/@count
    delta = @numbers.map { |i| i - @mean }
    delta_sq= delta.map{ |i| i**2}
    variance2 = delta_sq.sum/(@count)
    @variance=variance2.round(3)
    @standard_deviation = (variance2**0.5).round(3)
    @mode = @numbers.max_by { |i| @numbers.count(i) }
    render("calculations/stats_results.html.erb")
  end

end
