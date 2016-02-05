require 'csv'
require 'pry'

class CollegeScorecard
  attr_reader :scorecards

  def initialize
    @scorecards = CSV.open "2013_college_scorecards.csv", headers: true, header_converters: :symbol
  end

  def by_state(state)
    # STABBR will give us the state that the college is in
    # We want to get the array of colleges in that state (INSTNM header)
    college_names =[]
    scorecards.each do |row|
      if row[:stabbr] == state
        name = row[:instnm]
        college_names << name
      end
    end
    college_names
  end

  def by_salary
    #sort by this #AVGFACSAL
    #select 10 schools, (we don't know if it's the first ten or the last ten this depends on how we're sorting)
    # return this as an array of the names

    salary_pairs = scorecards.map do |row|
      [row[:instnm], row[:avgfacsal].to_i]
    end
    sorted = salary_pairs.sort_by! do |name, salary|
      salary
    end
    sorted[-10..-1].reverse.map do |name, salary|
      name
    end
  end






end

if __FILE__ == $0
  cs = CollegeScorecard.new
  #cs.get_headers
  # puts ARGV[0]
  # puts cs.by_state('AK')
  # puts
  puts "Top Salaries by Faculty"
  puts cs.by_salary

end
