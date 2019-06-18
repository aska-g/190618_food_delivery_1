class Patient
  attr_reader :name, :healthy
  attr_accessor :room, :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @healthy = attributes[:healthy] || false
    # @illness
    # @age
    # @blood_type
    @id = attributes[:id]
    @room = attributes[:room]
  end

  def cure
    @healthy = true
  end
end

