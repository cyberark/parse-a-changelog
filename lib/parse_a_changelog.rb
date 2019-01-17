require 'treetop'

module ParseAChangelog
  class ParseError < StandardError; end

  class Parser
    def self.parse(file_path)
      Treetop.load('lib/grammar')

      parser = KeepAChangelogParser.new
      file = File.read(file_path)

      result = parser.parse(file)

      if !result
        message = parser.failure_reason.split(' after ')[0]
        raise ParseError.new(message)
      end

      return result
    end
  end
end
