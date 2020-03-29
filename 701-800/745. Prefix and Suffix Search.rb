class WordFilter

=begin
    :type words: String[]
=end
    def initialize(words)
      @hash = {"" => {}}
      words.each_with_index do |word, i|
        (0..word.size-1).each do |j|
          prefix = word[0..j]
          @hash[prefix] ||= {}
          (0..word.size-1).each do |k|
            suffix = word[k..-1]
            @hash[prefix][suffix] = i
            @hash[""][suffix] = i
          end
          @hash[prefix][""] = i
        end
        @hash[""][""] = i
      end
    end


=begin
    :type prefix: String
    :type suffix: String
    :rtype: Integer
=end
    def f(prefix, suffix)
      @hash[prefix].nil? || @hash[prefix][suffix].nil? ? -1 : @hash[prefix][suffix]
    end


end

# Your WordFilter object will be instantiated and called as such:
# obj = WordFilter.new(words)
# param_1 = obj.f(prefix, suffix)
