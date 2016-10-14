module Pandora
  module Framework
    module Commands

      class Create

        attr_reader :name, :path

        def initialize(name, path)
          @name = name
          @path = path
        end

        def execute
          # TODO
        end

      end

    end
  end
end