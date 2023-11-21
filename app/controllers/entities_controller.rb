# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entities = Entity.all
  end

  def new; end

  def create; end

  def destroy; end
end
