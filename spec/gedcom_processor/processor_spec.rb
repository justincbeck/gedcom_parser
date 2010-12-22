require 'spec_helper'

module GedcomProcessor
  describe Processor do
    let(:output) { double('output').as_null_object }
    let(:processor) { Processor.new(output) }
    
    it "should throw an exception if the file is invalid" do
      output.should_receive(:puts).with("No such file or directory - ./data/bogus.ged")
      processor.process('./data/bogus.ged')
    end

    it "should not throw an exception if the file is valid" do
      output.should_receive(:puts).with("File successfully opened.")
      processor.process('./spec/spec_data/valid_head.ged')
    end
    
    it "should process valid submitter record" do
      output.should_receive(:puts).with("File successfully parsed.")
      processor.process('./spec/spec_data/valid_submitter.ged')
    end
    
    it "should process valid head record" do
      output.should_receive(:puts).with("File successfully parsed.")
      processor.process('./spec/spec_data/valid_head.ged')
    end
    
    it "should process valid individual record" do
      output.should_receive(:puts).with("File successfully parsed.")
      processor.process('./spec/spec_data/valid_individual.ged')
    end
    
    it "should process valid family record" do
      output.should_receive(:puts).with("File successfully parsed.")
      processor.process('./spec/spec_data/valid_family.ged')
    end
  end
end