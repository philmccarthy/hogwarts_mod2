require 'rails_helper'

RSpec.describe 'professor show page', type: :feature do
  describe 'as a visitor' do
    it 'I see a list of the names of the students the professors have' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit professor_path(snape)
      expect(page).to have_content(harry.name)
      expect(page).to have_content(longbottom.name)
      expect(page).to have_content("Students' Average Age: #{snape.students_avg_age}")
      
      visit professor_path(hagarid)
      expect(page).to have_content(harry.name)
      expect(page).to have_content(malfoy.name)
      expect(page).to have_content("Students' Average Age: #{hagarid.students_avg_age}")
      
      visit professor_path(lupin)
      expect(page).to have_content(harry.name)
      expect(page).to have_content(malfoy.name)
      expect(page).to have_content("Students' Average Age: #{lupin.students_avg_age}")
    end
  end
end