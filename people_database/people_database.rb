require_relative 'Person'
class PeopleDatabase
  attr_reader :people
  def initialize(people = [])
    @people = people
  end

  def add(person_info)
    people << Person.new(person_info)
  end

  def all_from_state(state)
    people.find_all do |person|
      person.state == state
    end
  end

  def all_emails
    people.map {|person| person.email}.join(", ")
  end

  def count_from_state(state)
    all_from_state(state).count
  end

  def delete(email)
    i = people.index {|person| person.email == email}
    people.delete_at(i)
  end
end

if __FILE__ == $0
  people_db = PeopleDatabase.new
  people_db.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO")
  people_db.add(first_name: "John", last_name: "Andersen", email: "john@gmail.com", state: "CO")
  people_db.add(first_name: "Riley", last_name: "Winterbaum", email: "riley.winterbaum@gmail.com", state: "AK")
  puts "CURRENT DATABASE:"
  puts people_db.people
  puts "\n All from State: "
  puts people_db.all_from_state("CO")
  puts
  puts people_db.all_from_state("AK")
  puts "\n Count from Colorado: "
  puts people_db.count_from_state("CO")

  puts people_db.delete("john@gmail.com")
  puts "\n After deletion"
  puts people_db.people
end
