require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) /Users/apprentice/Desktop/luket/project_raleigh/Rakefile"
  let(:valid_user){User.find(1)}

  it "has a username and password" do
    p valid_user
    expect(valid_user.username).to be_a String
    expect(valid_user.password_digest).to be_a String
  end

  it "has methods for challenge lookup" do
    expect(valid_user.challenges[0]).to be_a Challenge
  end

  it "has methods for UserPage lookup" do
    expect(valid_user.farthest_page).to be_a Page
    expect(valid_user.read_pages.first).to be_a Page
    expect(valid_user.read_pages.last).to eq(valid_user.farthest_page)
  end

  it "has a farthest_page_id of at least 1" do
    expect(valid_user.farthest_page.id >= 1).to be true
  end

end

