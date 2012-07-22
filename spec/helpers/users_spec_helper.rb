require 'spec_helper'

describe UsersHelper do
  describe "gravatar_for" do
    let(:user) { FactoryGirl.create(:user) }

    it "should use size 50 by default" do
      gravatar_for(user).should == '<img alt="Michael Hartl" class="gravatar" src="https://secure.gravatar.com/avatar/bebfcf57d6d8277d806a9ef3385c078d?s=50" />'
    end

    it "should substitute other sizes" do
      gravatar_for(user, :size => 30).should == '<img alt="Michael Hartl" class="gravatar" src="https://secure.gravatar.com/avatar/bebfcf57d6d8277d806a9ef3385c078d?s=30" />'
    end
  end

end
