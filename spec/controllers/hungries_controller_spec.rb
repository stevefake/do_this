require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe HungriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Hungry. As you add validations to Hungry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HungriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all hungries as @hungries" do
      hungry = Hungry.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:hungries)).to eq([hungry])
    end
  end

  describe "GET #show" do
    it "assigns the requested hungry as @hungry" do
      hungry = Hungry.create! valid_attributes
      get :show, {:id => hungry.to_param}, valid_session
      expect(assigns(:hungry)).to eq(hungry)
    end
  end

  describe "GET #new" do
    it "assigns a new hungry as @hungry" do
      get :new, {}, valid_session
      expect(assigns(:hungry)).to be_a_new(Hungry)
    end
  end

  describe "GET #edit" do
    it "assigns the requested hungry as @hungry" do
      hungry = Hungry.create! valid_attributes
      get :edit, {:id => hungry.to_param}, valid_session
      expect(assigns(:hungry)).to eq(hungry)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Hungry" do
        expect {
          post :create, {:hungry => valid_attributes}, valid_session
        }.to change(Hungry, :count).by(1)
      end

      it "assigns a newly created hungry as @hungry" do
        post :create, {:hungry => valid_attributes}, valid_session
        expect(assigns(:hungry)).to be_a(Hungry)
        expect(assigns(:hungry)).to be_persisted
      end

      it "redirects to the created hungry" do
        post :create, {:hungry => valid_attributes}, valid_session
        expect(response).to redirect_to(Hungry.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved hungry as @hungry" do
        post :create, {:hungry => invalid_attributes}, valid_session
        expect(assigns(:hungry)).to be_a_new(Hungry)
      end

      it "re-renders the 'new' template" do
        post :create, {:hungry => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested hungry" do
        hungry = Hungry.create! valid_attributes
        put :update, {:id => hungry.to_param, :hungry => new_attributes}, valid_session
        hungry.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested hungry as @hungry" do
        hungry = Hungry.create! valid_attributes
        put :update, {:id => hungry.to_param, :hungry => valid_attributes}, valid_session
        expect(assigns(:hungry)).to eq(hungry)
      end

      it "redirects to the hungry" do
        hungry = Hungry.create! valid_attributes
        put :update, {:id => hungry.to_param, :hungry => valid_attributes}, valid_session
        expect(response).to redirect_to(hungry)
      end
    end

    context "with invalid params" do
      it "assigns the hungry as @hungry" do
        hungry = Hungry.create! valid_attributes
        put :update, {:id => hungry.to_param, :hungry => invalid_attributes}, valid_session
        expect(assigns(:hungry)).to eq(hungry)
      end

      it "re-renders the 'edit' template" do
        hungry = Hungry.create! valid_attributes
        put :update, {:id => hungry.to_param, :hungry => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested hungry" do
      hungry = Hungry.create! valid_attributes
      expect {
        delete :destroy, {:id => hungry.to_param}, valid_session
      }.to change(Hungry, :count).by(-1)
    end

    it "redirects to the hungries list" do
      hungry = Hungry.create! valid_attributes
      delete :destroy, {:id => hungry.to_param}, valid_session
      expect(response).to redirect_to(hungries_url)
    end
  end

end
