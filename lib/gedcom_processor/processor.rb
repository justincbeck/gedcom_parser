# This module is used to parse GEDCOM output to XML

module GedcomProcessor
  class Processor
    def initialize(output)
      @output = output
    end
    
    def process(file_name)
      open_in_file(file_name)
      
      if !@in_file.nil?
        create_out_file(file_name)
        
        parser = Parser.new(@output)
        parser.parse(@in_file, @out_file)
        
        close_in_file
        close_out_file
        
        @output.puts "File successfully parsed."
      end
    end
    
    private

    def open_in_file(file_name)
      begin
        @in_file = File.open(file_name)
        @output.puts "File successfully opened."
      rescue Exception => e
        @output.puts e.to_s
      end
    end
    
    def close_in_file
      @in_file.close
    end
    
    def create_out_file(file_name)
      name = /^\.\/(?:\w+\/)*(\w+)\.\w{3}/.match(file_name)[1]
      @out_file = File.new("./output/#{name}.xml", "w+")
    end
    
    def close_out_file
      @out_file.close
    end
  end
end