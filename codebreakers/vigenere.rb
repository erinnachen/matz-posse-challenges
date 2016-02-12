class Vigenere
  attr_reader :keys

  def letters
    ('a'..'z').to_a
  end

  def initialize
    @keys = get_indices
  end

  def get_indices
    keyword = ARGV[0].downcase
    keyword.chars.map do |c|
      letters.index(c)+1
    end
  end

  def encode
    message = ARGV[1..-1].join(" ")
    letters_count = 0
    encoded = message.chars.map do |c|
      ind = letters.index(c.downcase)
      new_ind = (ind + keys[letters_count % keys.length]) % 26 if ind
      letters_count += 1 if ind
      if ind && c == c.upcase
        letters[new_ind].upcase
      elsif ind && c == c.downcase
        letters[new_ind]
      else
        c
      end

    end
    puts encoded.join
  end


end

if __FILE__ == $0
  vig = Vigenere.new
  vig.encode
end
