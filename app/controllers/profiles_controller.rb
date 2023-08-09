class ProfilesController < ApplicationController
  def index
    search_query = params[:query]
    query = User.ransack(username_cont: search_query)
    @users = query.result(distinct: true)
  end
end
