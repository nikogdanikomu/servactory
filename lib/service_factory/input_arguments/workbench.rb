# frozen_string_literal: true

module ServiceFactory
  module InputArguments
    class Workbench
      def self.work_with(...)
        new(...)
      end

      def initialize(collection_of_input_arguments)
        @collection_of_input_arguments = collection_of_input_arguments
      end

      def assign(context:, arguments:)
        @context = context
        @incoming_arguments = arguments
      end

      def find_unnecessary!
        Tools::FindUnnecessary.check!(context, @incoming_arguments, collection_of_input_arguments)
      end

      def check_rules!
        Tools::Rules.check!(context, collection_of_input_arguments)
      end

      def prepare
        Tools::Prepare.prepare(context, @incoming_arguments, collection_of_input_arguments)
      end

      def check!
        Tools::Check.check!(context, @incoming_arguments, collection_of_input_arguments)
      end

      private

      attr_reader :context, :collection_of_input_arguments
    end
  end
end
