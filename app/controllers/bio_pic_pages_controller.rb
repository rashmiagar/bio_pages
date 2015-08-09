class BioPicPagesController < ApplicationController
  before_action :set_user
  def new
  end

  def edit
  end

  def show
  	@user_mastered_skills = @user.skills.group_by{|skill| skill.user_skill.mastered}[true]
  	@user_learning_skills = @user.skills.group_by{|skill| skill.user_skill.mastered}[false]
  end

 private
 def set_user
 	@user = User.find_by_id(params[:id])
 	redirect_to root_url, :notice => "Invalid User ID" if @user.nil?
 end
end
