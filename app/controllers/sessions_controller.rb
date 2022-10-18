class SessionsController < Devise::SessionsController

  skip_before_action :auth_not_blocked!, :require_no_authentication

end