require 'treetop'
require 'grammar.tt'

module ParseAChangelog
  class ParseError < StandardError; end

  class << self
    def parse(file_path)
      file = File.read(file_path)
      parser = KeepAChangelogParser.new
      result = parser.parse(file)

      if !result
        raise ParseError.new(failure_message(parser))
      end

      result
    end

    def failure_message(parser)
      parser.failure_reason.split(' after ')[0]
    end
  end
end
