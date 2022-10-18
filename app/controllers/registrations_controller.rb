class RegistrationsController < Devise::RegistrationsController

  skip_before_action :auth_not_blocked!

end