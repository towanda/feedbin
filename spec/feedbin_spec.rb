require 'spec_helper'

describe FeedbinAPI do

  before do
    @feedbin = FeedbinAPI.new('email', 'password')
  end

  describe '.entries' do
  	it 'should get entries and return a 200' do
      stub_request(:get, "https://email:password@api.feedbin.me/v2/entries.json?").to_return(status: 200)
      @feedbin.entries.code.should == 200
  	end

    it 'should return a 200 when parameter is passed' do
      stub_request(:get, "https://email:password@api.feedbin.me/v2/entries.json?read=false").to_return(status: 200)
      @feedbin.entries(read: false).code.should == 200
    end
  end

  describe '.subscriptions' do
    it 'should get subscriptions and return a 200' do
      stub_request(:get, "https://email:password@api.feedbin.me/v2/subscriptions.json").to_return(status: 200)
      @feedbin.subscriptions.code.should == 200
    end
  end

  describe '.star' do
    it 'should star a post and return a 200' do
      stub_request(:post, "https://email:password@api.feedbin.me/v2/starred_entries.json").to_return(status: 200)
      @feedbin.star(33).code.should == 200
    end

    it 'should star an array of posts and return a 200' do
      stub_request(:post, "https://email:password@api.feedbin.me/v2/starred_entries.json").to_return(status: 200)
      @feedbin.star([33,44,55,66,77]).code.should == 200
    end
  end
end