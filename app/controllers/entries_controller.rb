class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  
  def index
  @entries = Entry.all
  @websites = [
    ["http://railscasts.com", "Rails Casts"],
    ["https://en.wikibooks.org/wiki/Ruby_Programming", "Wikibooks"],
    ["http://guides.rubyonrails.org", "Ruby on Rails Guides"]
  ]

  end

  def show
  end

  def new
  end

  def create
    entry = Entry.create(entry_params)
    redirect_to(entry_path(entry))
  end

  def edit
  end

  def update
    @entry.update(entry_params)
    redirect_to(entry_path(@entry))
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :content)
  end

end
