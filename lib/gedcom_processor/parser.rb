require 'rexml/document'
include REXML

module GedcomProcessor
  class Parser

    def initialize(output)
      @output = output
      @components = Array.new
      @elements = Array.new
    end

    def parse(in_file, out_file)
      document = Document.new
      root = Element.new "gedcom"
      document.add_element root

      in_file.each_line do |line|
        segments = line.split
        depth = segments.shift
        e_name = segments.shift
        e_data = segments.join " "

#        puts "depth: " + depth
#        puts "element: " + e_name
#        puts "data: " + e_data

        if e_data.eql? "INDI"
          element = Element.new e_data.downcase
          element.add_attribute "id", e_name
        else
          element = Element.new e_name.downcase
          element.text = e_data

          if e_name.eql? "NAME"
            n_segs = e_data.split

            s_el = Element.new "surn"
            s_el.text = n_segs.pop.scan(/\w+/)[0]
            element.add_element s_el

            g_el = Element.new "givn"
            g_el.text = n_segs.join " "
            element.add_element g_el
          end
        end

        document.root.add_element element

      end
      document.write STDOUT, 2
    end

    private

    def parse_component(component)
      type = component[0][1]
      case type
        when "INDI"
          c_parser = IndividualParser.new
          c_parser.parse component
        else
          @output.puts "Not yet implemented"
      end
    end
  end
end