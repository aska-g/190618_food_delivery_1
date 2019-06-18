class Room
  attr_accessor :id

  def initialize(attributes = {})
    @room_number = attributes[:room_number]
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
    @id = attributes[:id]
  end

  def full?
    @capacity == @patients.size
  end

  def add(patient)
    if full?
      raise Exception, 'The room is full, sorry'
    else
      patient.room = self # instance of Room
      @patients << patient
    end
  end
end
