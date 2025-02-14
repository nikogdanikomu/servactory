# frozen_string_literal: true

module Servactory
  module Inputs
    module Validations
      class Required < Base
        DEFAULT_MESSAGE = lambda do |service_class_name:, input:, value:|
          i18n_key = "servactory.inputs.checks.required.default_error."
          i18n_key += input.array? && value.present? ? "for_array" : "default"

          I18n.t(
            i18n_key,
            service_class_name: service_class_name,
            input_name: input.name
          )
        end

        private_constant :DEFAULT_MESSAGE

        def self.check(context:, input:, value:, check_key:, **)
          return unless should_be_checked_for?(input, check_key)

          new(context: context, input: input, value: value).check
        end

        def self.should_be_checked_for?(input, check_key)
          check_key == :required && input.required?
        end

        ##########################################################################

        def initialize(context:, input:, value:)
          super()

          @context = context
          @input = input
          @value = value
        end

        def check # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
          if @input.array? && @value.present?
            return if @value.respond_to?(:all?) && @value.all?(&:present?)
          elsif @value.present?
            return
          end

          _, message = @input.required.values_at(:is, :message)

          add_error(
            message.presence || DEFAULT_MESSAGE,
            service_class_name: @context.class.name,
            input: @input,
            value: @value
          )
        end
      end
    end
  end
end
