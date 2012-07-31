require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "Signup"  do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    it { should have_header('Signup') }
    it { should have_title(full_title('Signup')) }

    it "should not create invalid user" do
      expect { click_button submit }.not_to change(User, :count)
    end

    describe "invalid user" do
      before { click_button submit }

      it { should have_content 'error' }
      it { should have_title("Signup") }
    end

    describe "valid user" do
      let(:user_name) { "Example User" }

      before do
        fill_in "Name",         with: user_name
        fill_in "Email",        with: "example@railstutorial.org"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "produces a page" do
        before { click_button submit }
        it { should have_success_message('Welcome') }
        it { should_not have_content 'error' }
        it { should have_link('Sign out') }

        describe "should redirect to shown profile" do
          it { should have_header(user_name) }
          it { should have_title(user_name) }
        end
      end
    end
  end


  describe "Profile Page" do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path(user) }

    it { should_not have_content('Welcome') }
    it { should have_header(user.name) }
    it { should have_title(user.name) }
  end


  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should  == new_name }
      specify { user.reload.email.should == new_email }
    end
  end
end
