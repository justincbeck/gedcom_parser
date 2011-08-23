require 'spec_helper'

module GedcomProcessor
  describe IndividualParser do
    let(:output) { double('output').as_null_object }
    let(:parser) { IndividualParser.new(output) }

    it "should parse an individual defined in Gedcom and produce valid XML" do
      in_file = File.join(File.dirname(__FILE__), '../', 'spec_data', "valid_individual.ged")
      out_file = File.join(File.dirname(__FILE__), '../../', 'output', "valid_individual.xml")

      parser.parse(File.new(in_file), File.new(out_file))
    end
  end
end
