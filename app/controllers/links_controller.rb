class LinksController < ApplicationController
  def index
    @links = current_user.links
    @hot_links = Link.hot
  end
end
