class Patient
  attr_accessor :room, :id
  attr_reader :cured

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # if we don't specify if he is cured when we instantiate him, by default the cured status will be false, not nil.
    @room = attributes[:room] # Room instance
  end

  def cured!
    @cured = true
  end

end

