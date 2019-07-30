class Room
  attr_reader :patients
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0 # capacity or the default of 0
    @patients = attributes[:patients] || [] # default empty array if nothing passed in
  end

  def full?
    @capacity == @patients.length
  end

  def add(patient)
    unless full?
      patient.room = self # when we add the patient we set his room as the room we are instantiating at the moment.
      @patients << patient
    end
  end












end
