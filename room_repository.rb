class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.detect {|room| room.id == id}
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:room_number] = row[:room_number].to_i

      @rooms << Room.new(row)
    end
  end
end
