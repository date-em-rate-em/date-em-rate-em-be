class Error
  attr_reader :message, :status

  def initialize(attributes)
    @message = attributes[:message]
    @status = attributes[:status]
  end

end