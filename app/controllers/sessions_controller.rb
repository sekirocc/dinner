class SessionsController < Devise::SessionsController
  
  skip_before_filter :auth_not_blocked!, :require_no_authentication

end