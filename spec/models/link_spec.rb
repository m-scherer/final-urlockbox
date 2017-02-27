require 'rails_helper'

RSpec.describe Link, type: :model do
  context '#valid_link?' do
    it "can validate a link" do
      link = Link.new(title: "test", url:"https://turing.io", user_id: 1)

      expect(link.valid_link?).to eq(nil)
    end
    it "validates a url" do
      link = Link.new(title: "test", url:"https://turing.io", user_id: 1)

      expect(link.valid_url?).to eq(true)
    end
    it "flags an invalid link" do
      link = Link.new(title: "test", url:"turing.io", user_id: 1)

      expect(link.valid_link?).to eq({message: "Invalid URL"})
    end
    it "flags an invalid title" do
      link = Link.new(url:"http://turing.io", user_id: 1)

      expect(link.valid_link?).to eq({message: "Missing title"})
    end
    it "flags an invalid url" do
      link = Link.new(title: 'test', url:"turing.io", user_id: 1)

      expect(link.valid_url?).to eq(false)
    end
  end
end
