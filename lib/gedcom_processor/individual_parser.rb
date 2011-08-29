require 'builder'

module GedcomProcessor
  class IndividualParser
    def initialize(output)
      @output = output
    end

    def parse(component)
      @output.puts "Parsing"

      builder = Builder::XmlMarkup.new

      component.each do |line|
        line.each do |element|
          @output.puts element
        end
      end
    end
  end
end