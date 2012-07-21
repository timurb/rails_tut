require 'spec_helper'

describe "UserPages" do

  describe "Pages" do
    subject { page }

    describe "Signup Page"  do
      before { visit signup_path }

      it { should have_selector('h1',        :text => 'Signup') }
      it { should have_selector('title',     :text => full_title('Signup')) }
    end

    describe "Profile Page" do
      let(:user) { FactoryGirl.create(:user) }

      before { visit user_path(user) }

      it { should_not have_content('Welcome') }
      it { should have_selector('h1',    text: user.name) }
      it { should have_selector('title', text: user.name) }
    end
  end

  describe "Signup" do
    before do
      visit signup_path
    end
    let(:submit) { "Create my account" }
    subject { page }

      it "should not create invalid user" do
        expect { click_button submit }.not_to change(User, :count)
      end

    describe "invalid user" do
      before { click_button submit }

      it { should have_content 'error' }
      it { should have_selector('title', :text => "Signup") }
    end

    describe "valid user" do
      let(:user_name) { "Example User" }

      before do
        fill_in "Name",         with: user_name
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "produces a page" do
        before { click_button submit }
        it { should have_content 'Welcome' }
        it { should_not have_content 'error' }

        describe "should redirect to shown profile" do
          it { should have_selector('h1',    text: user_name) }
          it { should have_selector('title', text: user_name) }
        end
      end
    end
  end
end
