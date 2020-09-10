require 'treetop'
require 'grammar'

module ParseAChangelog
  class ParseError < StandardError; end

  class << self
    def parse(file_path)
      file = File.read(file_path)
      parser = KeepAChangelogParser.new
      result = parser.parse(file)

      raise ParseError, failure_message(parser) unless result

      result
    end

    def failure_message(parser)
      parser.failure_reason.split(' after ')[0]
    end
  end
end
