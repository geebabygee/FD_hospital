require_relative "patient"
require_relative "room"
require_relative "patient_repository"
require "csv"
kanye = Patient.new(name: "Kanye", cured: true)
jay = Patient.new(name: "Jay")
drake = Patient.new(name: "Drake")
room = Room.new(capacity: 2)

csv_file = "patients.csv"
patient_repository = PatientRepository.new(csv_file)

room.add(kanye)
room.add(jay)
puts "Is the room full NOWWWW?"
p room.full?

p room.patients # A room knows its patients
p kanye.room # A patient also knows his room, thanks to the self in the add method.


patient_repository.add(kanye)
patient_repository.add(jay)
p patient_repository



# Rails DB relationship will look like...

# Model Patient
# belongs_to :room

# Model Room
# has_many :patients















