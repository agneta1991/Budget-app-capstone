# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all.order(created_at: :desc)
    @total_amount = 0

    @groups.each do |group|
      @total_amount += group.entities.sum(:amount)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params.merge(user_id: current_user.id))

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, status: 422
    end
  end

  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
