require 'treetop'
require 'grammar'

module ParseAChangelog
  class ParseError < StandardError; end

  class << self
    def parse(file_path)
      file = File.read(file_path)
      parser = KeepAChangelogParser.new
      result = parser.parse(file)

      unless result
        raise parser_error(
                parser.failure_line, parser.failure_column, parser.failure_reason
              )
      end
      
      result
    end

    def parser_error(line, column, reason)
      ParseError.new("line #{line}, column #{column}: #{reason}")
    end
  end
end
