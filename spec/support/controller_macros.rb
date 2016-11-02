module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
  def create_charity
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:charity]
      charity1 = FactoryGirl.create(:charity)
      charity2 = FactoryGirl.create(:charity)
    end
  end
end