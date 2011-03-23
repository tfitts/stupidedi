module Stupidedi
  module Reader

    class Position
      include Inspect

      # @return [Integer]
      attr_reader :offset

      # @return [Integer]
      attr_reader :line

      # @return [Integer]
      attr_reader :column

      # @return [String, Pathname]
      attr_reader :path

      def initialize(offset, line, column, path)
        @offset, @line, @column, @path =
          offset, line, column, path
      end

      def copy(changes = {})
        Position.new \
          changes.fetch(:offset, @offset),
          changes.fetch(:line, @line),
          changes.fetch(:column, @column),
          changes.fetch(:path, @path)
      end

      # @return [void]
      def pretty_print(q)
        q.text "Position"
        q.group(2, "(", ")") do
          q.breakable ""
          q.text "line #{@line},"
          q.breakable
          q.text "column #{@column},"
          q.breakable
          q.text "offset #{@offset}"

          unless @path.nil?
            q.text ","
            q.breakable
            q.text "path #{@path}"
          end
        end
      end
    end

  end
end