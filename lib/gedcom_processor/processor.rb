# This module is used to parse GEDCOM output to XML

module GedcomProcessor
  class Processor
    def initialize(output)
      @output = output
    end
    
    def process(file_name)
      begin
        @in_file = File.open(file_name)
      rescue Exception => e
        @output.puts e.to_s
      end

      if !@in_file.nil?
        name = /^\.*\/?(?:\w+\/)*(?:\.{2}\/)?(?:\w+\/)*(\w+)\.\w{3}$/.match(file_name)[1]
        out_file_name = File.join(File.dirname(__FILE__), '../../', 'output', name + ".xml")
        @out_file = File.new(out_file_name, "w+")

        parser = Parser.new(@output)
        parser.parse(@in_file, @out_file)
        
        @in_file.close
        @out_file.close
      end
    end
  end
end