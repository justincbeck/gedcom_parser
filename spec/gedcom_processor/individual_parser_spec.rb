require 'spec_helper'

module GedcomProcessor
  describe IndividualParser do
    let(:output) { double('output').as_null_object }
    let(:parser) { IndividualParser.new(output) }

    it "should parse an individual defined in Gedcom and produce valid XML" do
      in_file_name = File.join(File.dirname(__FILE__), '../', 'spec_data', "valid_individual.ged")
      in_file = File.open(in_file_name)

      component = Array.new
      in_file.each_line do |line|
        component << line.split
      end

      parser.parse(component)
    end
  end
end
