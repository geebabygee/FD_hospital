class PatientRepository
  def initialize(csv_file, room_repo)
    @patients = []
    @csv_file = csv_file
    @room_repo = room_repo
    @next_id = 1 # for auto-incrementation strategy
    load_csv
  end

  def add(patient)
    patient.id = @next_id # set the id as the next_id when we add him
    @patients << patient
    @next_id += 1 # get ready for the next patient by resetting the next_id
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol } # first row you will find headers, turn these to symbols
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i # Convert string id from csv to integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      row[:room] = @room_repo.find(row[:room_id]).to_i # use room_id to give to room repo and extract room instance at that id
      @patients << Patient.new(row)
    end
    @next_id = @patients.last.id + 1 unless @patients.empty? # when we load we also have to update the next_id so that we are ready for the next patient
  end

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id","name","cured"] # first put the headers in the csv row
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured] #extract the attributes and put into csv row
      end
    end
  end
end



end
