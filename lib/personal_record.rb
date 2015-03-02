class PersonalRecord
  attr_reader :last_name, :first_name, :gender, :favorite_color, :date_of_birth

  def initialize(params)
    @last_name = params[:last_name]
    @first_name = params[:first_name]
    @gender = params[:gender]
    @favorite_color = params[:favorite_color]
    @date_of_birth = params[:date_of_birth]
  end

  def read_record_attributes
    {
    last_name: last_name,
    first_name: first_name,
    gender: gender,
    favorite_color: favorite_color,
    date_of_birth: date_of_birth
    }
  end

end
