class UserSession < Authlogic::Session::Base 
  logout_on_timeout true
  
  # Timeout session in seconds
     SESSION_TIMEOUT=30  # for tests

     before_validation :check_timeout

  
  
   
    private

    # enforce session timeout
    def check_timeout
      if (record and  not authenticating_with_password?)
        errors.add_to_base("Your session has timed out") if @record.last_request_at + SESSION_TIMEOUT < Time.zone.now
      end
    end
  
end
 