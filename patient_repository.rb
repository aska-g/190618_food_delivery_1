require 'csv'

class PatientRepository
  def initialize(csv_file, room_repository)
    @patients = []
    @room_repository = room_repository
    @csv_file = csv_file
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
  end

  def patients_number # => in the whole hospital
    @patients.length
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      # row[0], row[1]
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:healthy] = row[:healthy] == "true"  # Convert column to boolean
      room_id = row[:room_id].to_i
      row[:room] = @room_repository.find(room_id)

      @patients << Patient.new(row)
    end

    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end













