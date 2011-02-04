module GedcomProcessor
  class Parser
    def initialize(output)
      @output = output
    end
    
    def parse(in_file, out_file)
      in_file.each_line do |line|
        out_file.write(line)
      end
    end
  end
end