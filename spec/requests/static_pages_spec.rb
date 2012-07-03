require 'spec_helper'

def page(path,header,title=nil)
  title ||= header
  it "should have the content '#{header}'" do
    visit "/static_pages/#{path}"
    page.should have_selector('h1', :text=>header)
  end

  it "should have the title '#{title}'" do
    visit "/static_pages/#{path}"
    page.should have_selector('title',
             :text => "| #{title}")
  end
end

describe "Static Pages" do

  describe "Home Page"  do
    page('home', 'Sample App', 'Home')
  end

  describe "Help Page" do
    page('help', 'Help')
  end

  describe "About Page" do
      page('about', 'About')
  end
end
