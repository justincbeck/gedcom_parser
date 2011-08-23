require 'builder'

module GedcomProcessor
  class IndividualParser < Parser
    def parse(input, out)
      builder = Builder::XmlMarkup.new

      while line = input.gets

      end
    end
  end
end