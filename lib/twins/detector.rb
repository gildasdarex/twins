module Twins
  class Detector
    class << self
      def twins(a, b)
        return if a.size == 0 || b.size == 0 || a.size != b.size

        a.map.with_index { |phrase, index| twins?(phrase, b[index]) ? 'Yes' : 'No' }
      end

      private

      # If two phrases have the same encoding, then they're twins
      def twins?(phrase_a, phrase_b)
        return false if phrase_a.length != phrase_b.length
        encode(phrase_a) == encode(phrase_b)
      end

      def encode(phrase)
        even_map = Hash.new(0)
        odd_map  = Hash.new(0)

        phrase.each_char.with_index(1) do |char, index|
          char = char.downcase

          index.even? ? even_map[char] += 1 : odd_map[char] += 1
        end

        ('a'..'z').map { |char| "#{char}-#{even_map[char]}-#{odd_map[char]}" }
      end
    end
  end
end