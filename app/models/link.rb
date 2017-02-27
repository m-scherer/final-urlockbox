class Link < ApplicationRecord
  belongs_to :user
  scope :hot, -> {
    select('links.url as url')
      .joins('join reads on reads.link_id = links.id')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("links.url")
      .order('count("reads".id) DESC').limit(10)
  }

  def valid_link?
    if !self.title || self.title == ""
      { message: "Missing title" }
    elsif !valid_url?
      { message: "Invalid URL" }
    end
  end

  def valid_url?
    uri = URI.parse(self.url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  end

end
