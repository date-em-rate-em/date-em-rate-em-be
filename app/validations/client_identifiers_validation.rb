class ClientIdentfiersValidation < ActiveModel::Validator
  def validate(record)
    unless(record.email || record.phone)
      record.errors.add :email, "A review requires either an email or phone number to identify the client."
    end
  end
end
