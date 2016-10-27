class CharitiesController < ApplicationController
    before_filter :validate_admin
    
    def charity_params
    params.require(:charity).permit(:name,
                                 :description,
                                 :ein,
                                 :image_link,
                                 :homepage_link,
                                 :donation_link
                                 )
    end
    
    def index
        @charities = Charity.all
    end
    
    def new
    end
    
    def create
       charity = Charity.new(charity_params)
       if charity.valid?
           charity.save
           flash[:success] = "Charity was Successfully Created."
           redirect_to charities_path
       else
           totalMessage = ""
           charity.errors.messages.each do |key, message|
               totalMessage += "#{key.to_s().gsub('_', ' ').capitalize} #{message.join("', and'")}; "
           end
           flash[:danger] = totalMessage
           redirect_to post new_charity_path()
       end
    end
    
    def edit
        id = params[:id]
        @charity = Charity.find(id)
    end
    
    def update
        charity = Charity.find(params[:id])
        cp = charity_params
        charity.assign_attributes(cp)
        if charity.valid?
           charity.save
           flash[:success] = "Charity was Successfully Updated."
           redirect_to charities_path
        else
           totalMessage = ""
           charity.errors.messages.each do |key, message|
               totalMessage += "#{key.to_s().gsub('_', ' ').capitalize} #{message.join("', and'")}; "
           end
           flash[:danger] = totalMessage
           redirect_to edit_charity_path()
       end
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