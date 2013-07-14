class RegistrationsController < Devise::RegistrationsController
  
  skip_before_filter :auth_not_blocked!

end