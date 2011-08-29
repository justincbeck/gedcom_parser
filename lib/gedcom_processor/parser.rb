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
      stack = Array.new
      stack.push []
      p_depth = 0
      document = Document.new
      root = Element.new "gedcom"
      document.add_element root

      in_file.each_line do |line|
        if line.strip.length > 0
          segments = line.split
          depth = segments.shift.to_i
          e_name = segments.shift
          e_data = segments.join " "

          element = Element.new e_name.downcase
          element.text = e_data

          if p_depth == depth
            peers = stack.pop
            peers << element
            stack.push peers
          elsif depth.to_i > p_depth.to_i
            stack.push [element]
          elsif depth.to_i < p_depth.to_i
            dd = p_depth - depth
            dd.times do
              youngsters = stack.pop
              peers = stack.pop
              youngsters.each do |y|
                peers.last.add_element y
              end

              peers << element
              stack.push peers
            end
          end

          p_depth = depth
        end
      end

      stack.pop.each do |e|
        document.root.add_element e
      end

      document.write out_file, 2
    end
  end
end