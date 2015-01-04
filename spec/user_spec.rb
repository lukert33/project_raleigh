require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) /Users/apprentice/Desktop/luket/project_raleigh/Rakefile"
  let(:valid_user){User.find(1)}

  it "has a username and password" do
    expect(valid_user.username).to be_truthy
    expect(valid_user.password).to be_truthy
  end

  it "has methods for challenge lookup" do
    expect(valid_user.methods.include(challenges)).to_be true
  end

  it "has methods for UserPage lookup" do
    expect(valid_user.methods.include(farthest_page)).to_be true
    expect(valid_user.methods.include(read_pages)).to_be true
  end

  it "has a farthest_page_id of at least 1" do
    expect(valid_user.farthest_page).to_be >= 1
  end

end

