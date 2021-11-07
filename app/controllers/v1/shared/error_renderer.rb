module V1
  module Shared
    module ErrorRenderer

      private

      def render_errors(message, status)
        status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
        render json: { errors: { status: status_code, message: message } }, status: status
      end

      def not_found
        render_errors(I18n.t('errors.messages.not_found'), :not_found)
      end

      def bad_request
        render_errors(I18n.t('errors.messages.bad_request'), :bad_request)
      end

      def parameter_missing
        render_errors(I18n.t('errors.messages.parameter_missing'), :unprocessable_entity)
      end
    end
  end
end
