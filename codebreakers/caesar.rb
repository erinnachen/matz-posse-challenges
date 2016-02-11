class Caesar
  def letters
    ('a'..'z').to_a
  end

  def encode_with_each
    #puts ARGV.inspect
    key = ARGV[0].to_i
    message = ARGV[1..-1].join(" ")
    #puts "Here's my key: #{key}"
    #puts "Here's the message: #{message}"
    # How do we encode:
    # We take each letter of our message, find what index that letter is, and then add key to that index, and replace our letter with the letter at the new index.
    encoded_message = []
    message.chars.map do |c|
      if letters.include? (c.downcase)
        ind = letters.index(c.downcase)
        new_ind = (ind + key) % 26
        new_letter = letters[new_ind]
        if c == c.upcase
          new_letter = new_letter.upcase
        end
        encoded_message << new_letter
      else
        encoded_message << c
      end
    end
    puts encoded_message.join
  end

  def encode
    key = ARGV[0].to_i
    message = ARGV[1..-1].join(" ")
    encoded = message.chars.map do |c|

      ind = letters.index(c.downcase)
      new_ind = (ind + key) % 26 if ind

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
  salad = Caesar.new
  salad.encode
end
