require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
  	before { visit path }
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end


  describe "Home page" do
  	let(:path)			 { root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
  	let(:path)			 { help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
  	let(:path)			 { about_path }
  	let(:heading) 	 { 'About' }
  	let(:page_title) { 'About' }

  	it_should_behave_like "all static pages"
  end

  describe "Contact page" do
  	let(:path)			 { contact_path }
  	let(:heading) 	 { 'Contact' }
  	let(:page_title) { 'Contact' }

  	it_should_behave_like "all static pages"
  end

 	it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end
end