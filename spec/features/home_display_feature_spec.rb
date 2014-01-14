require 'spec_helper'

describe "when i visit the root path" do
  before do
    @country = Country.create!(tweet_id: 1, info_id: 1, user_id: 1, name: "syria", woeid: 23424956)
    @govt_info = "you don't want to be here."
    @tweet = "#isis isn't just a conjugation of to be."
    @username = "Elagabalus"
    @password = "born-purp"
    @comment = "And I thought I was a bad Syrian."
  end

  describe "it should allow a country to be selected" do
    before do
      visit '/'
      puts page.body
      select(@country.name, :from => 'country')
      click_on('search')
    end

    it "should display information from the state dept and from twitter" do
      visit '/countries/display'
      page.should have_content(@tweet)
      page.should have_content(@govt_info)
    end
  end

  # describe "a user can login" do
  #   before do
  #     visit home_index_path
  #     fill_in 'username', with: @username
  #     fill_in 'password', with: @password
  #     find_button("login").click
  #   end

  #   it "it should display all user's posts by country" do
  #     visit user_path
  #     page.should have_content(@country)
  #     page.should have_content(@username)
  #     page.should have_content(@comment)
  #   end
  # end
end


# describe "country path should facilitate a blog" do
#   before do
#     visit country_path
#     fill_in 'comment', with: @comment
#     find_button("post").click
#   end

#   it "should display all content" do  
#     page.should have_content(@tweet)
#     page.should have_content(@comment)
#     page.should have_content(@govt_info)
#   end
# end









