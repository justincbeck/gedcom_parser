require 'spec_helper'

module GedcomProcessor
  describe IndividualParser do
    let(:output) { double('output').as_null_object }
    let(:processor) { Processor.new(output) }

    it "should parse an individual defined in Gedcom and produce valid XML" do
      true.should == false
    end
  end
end
