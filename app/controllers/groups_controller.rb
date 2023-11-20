class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
  
    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def destroy; end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
