class SearchController < ApplicationController

  def search_results
    if params[:header_search]
      @users = User.search(params[:header_search].downcase)
      @skills = Skill.search(params[:header_search].downcase)
      @projects = Project.search(params[:header_search].downcase)
    end
    render 'result'
  end
end