module CheckErrorMessagesSupport
  def check_error_messages(object, message)
    object.valid?
    expect(object.errors.full_messages).to include(message)
  end
end
