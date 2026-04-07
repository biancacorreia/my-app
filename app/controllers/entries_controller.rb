class EntriesController < ApplicationController
  def index
    @entries = Entry.order(worn_on: :desc)
  end

  def show
  end

  def new
    @entry = Entry.new(worn_on: Date.today)
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path, notice: "Entry added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      redirect_to entries_path, notice: "Entry updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice: "Entry deleted."
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:fragrance_name, :brand, :occasion, :strength, :notes, :worn_on)
  end
end
