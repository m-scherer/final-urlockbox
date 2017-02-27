require 'rails_helper'

RSpec.describe "Links Controller" do
  context 'POST /api/v1/links' do
    it "can create a link" do
      user_logs_in
      params = {title: "Test", url: "http://example.com"}

      post '/api/v1/links', params: params

      expect(response.status).to eq(201)
      expect(Link.count).to eq(1)
    end
    it "doesn't create an invalid link" do
      user_logs_in
      params = {title: "Test", url: "example.com"}

      post '/api/v1/links', params: params

      expect(response.status).to eq(412)
      expect(Link.count).to eq(0)
    end
  end
end
