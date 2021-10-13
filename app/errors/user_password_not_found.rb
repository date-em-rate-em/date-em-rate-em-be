class UserPasswordNotFound < StandardError

  def http_status
    404
  end

  def code
    'user_or_password'
  end

  def message
    'Email or password entered incorrectly.'
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end