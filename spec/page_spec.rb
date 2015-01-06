require 'spec_helper'

describe Page do
  let(:valid_page){Page.find(1)}
  let(:test_challenge_page){Page.all.find{|p| p.has_challenge?} }

  it "can return whether or not it has a challenge" do
    expect(valid_page.has_challenge?).to be false
    expect(test_challenge_page.has_challenge?). to be true
  end

  it "has a next page as an attribute" do
    expect(valid_page.next_page_id).to be_a Integer
    expect(valid_page.next_page).to be_a Page
  end

  it "has no next page if it has a challenge" do
    expect(test_challenge_page)
  end

  it "has a prev_pages method that find the pages leading to it" do
    n = Page.find(valid_page.id + 1)
    expect(n.prev_pages.include?(valid_page) ).to be true
  end

end
