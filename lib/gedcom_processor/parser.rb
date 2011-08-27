module GedcomProcessor
  class Parser

    def initialize(output)
      @output = output
      @components = Array.new
      @elements = Array.new
    end
    
    def parse(in_file, out_file)
      depth = 0
      component = Array.new
      in_file.each_line do |line|
        segments = line.split
        if segments[0] == 0
          xml = parse_component(component)
          out_file.write(xml)
          component = Array.new
        end

        component << segments

      end
    end

    private

    def parse_component(component)
      type = component[0][1]
      case type
        when "INDI"
          c_parser = IndividualParser.new
          c_parser.parse component
        else
          raise Exception.new "Not yet implemented"
      end
    end
  end
end