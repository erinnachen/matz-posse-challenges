class Person
  attr_reader :first_name, :last_name, :email, :state
  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email = info[:email]
    @state = info[:state]
  end

  def to_s
    "Name: #{first_name} #{last_name}\nEmail: #{email}\nState: #{state}"
  end
end
