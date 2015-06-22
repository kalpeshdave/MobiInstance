class DevelopmentMailInterceptor

  def self.delivering_email(message)
    message.to = "kalpeshdave@foundershookup.com"
    message.cc = "kalpeshdave@foundershookup.com"
  end

end