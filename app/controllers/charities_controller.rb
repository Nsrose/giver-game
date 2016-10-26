class CharitiesController < ApplicationController
    before_filter :validate_admin
    
    def index
        @charities = Charity.all()
    end
    
    def new
        
    
    end
    
        
    protected 
    def validate_admin
        # if !current_user.isAdmin?
        #     flash[:warning] = "Only Administrators can create charities"
        #     redirect_to new_user_session_path
        # end
        # return
    end
end