module GetErrorMessagesSupport
  def get_error_messages(object)
    object.valid?
    object.errors.full_messages
  end
end
