require 'rails_helper'

RSpec.describe SessionsController do
  let(:customer) {User.create(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com')}

  let(:valid_attributes) {
    {session: {username: 'tomtom', password: 'tomtom'}}
  }
  let(:invalid_attributes) {
    {session: {username: '', password: ''}}
  }
  let(:invalid_password) {
    {session: {username: 'tomtom', password: 'nottomspassword',}}
  }

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "assigns user as @user with passed params" do
      post :create, params: valid_attributes
      expect(assigns(:user)).to eq(@user)
    end

    context "with invalid params" do
      it "assigns the user as nil" do
        post :create, params: invalid_attributes
        expect(assigns(:user)).to be(nil)
      end

      it "re-renders the 'new' template" do
        post :create, params: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "logout" do
    it "has a custom route" do
      assert_recognizes({controller: "sessions", action: "destroy"}, {path: "/logout", method: 'get'})
    end
  end
end
