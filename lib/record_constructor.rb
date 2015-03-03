require 'personal_record'

class RecordConstructor
  def create_personal_record(data_record)
    PersonalRecord.new(data_record)
  end
end
