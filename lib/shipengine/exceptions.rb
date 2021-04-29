module ShipEngine
  module Exceptions
    #  standard class - network connection error / internal server error /etc

    class ShipEngineError < StandardError
      def initialize(message_or_messages)
        message = message_or_messages.is_a?(Array) ? message_or_messages.join('\n') : message_or_messages
        super(message)
      end
    end

    # 400 error, or other "user exceptions"
    class ShipEngineErrorDetailed < ShipEngineError
      attr_reader :request_id, :message, :source, :type, :code

      def initialize(request_id, message, source, type, code)
        super(message)
        @request_id = request_id
        @message = message  # super with attribute reader seems odd
        @source = source
        @type = type
        @code = code
      end
    end
  end
end
