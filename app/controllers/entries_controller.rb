class EntriesController < ApplicationController
  def index
    @entries = Entry.order(worn_on: :desc)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
