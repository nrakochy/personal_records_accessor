require 'json'

class PersonalRecord
  attr_reader :last_name, :first_name, :gender, :favorite_color, :date_of_birth, :date_year_month_day

  def initialize(params)
    @last_name = params[:last_name]
    @first_name = params[:first_name]
    @gender = params[:gender]
    @favorite_color = params[:favorite_color]
    @date_of_birth = params[:date_of_birth]
    @date_year_month_day = find_date_year_month_day
  end

  def find_date_year_month_day(date = @date_of_birth)
    reversed_date = date.split('/').reverse
    reversed_date[0] + "/" + reversed_date[2] + "/" + reversed_date[1]
  end

  def read_record_attributes
    {
      last_name: @last_name,
      first_name: @first_name,
      gender: @gender,
      favorite_color: @favorite_color,
      date_of_birth: @date_of_birth,
      date_year_month_day: @date_year_month_day
    }
  end

  def read_record_attributes_without_reformatted_date_included
    {
      last_name: @last_name,
      first_name: @first_name,
      gender: @gender,
      favorite_color: @favorite_color,
      date_of_birth: @date_of_birth,
    }
  end



  def convert_to_json
    read_record_attributes.to_json
  end

end
