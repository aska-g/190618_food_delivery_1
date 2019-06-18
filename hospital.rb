require_relative 'patient'
require_relative 'room'
require_relative 'patient_repository'
require_relative 'room_repository'

room_repo = RoomRepository.new('rooms.csv')
patient_repo = PatientRepository.new('patients.csv', room_repo)

room_1 = Room.new(capacity: 2, room_number: 303)
ringo = Patient.new(name: 'Ringo')


patient_repo.add(ringo)

p patient_repo
p room_repo


