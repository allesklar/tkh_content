class TagsController < ApplicationController

  before_filter :authenticate
  before_filter :authenticate_with_admin

  def index
    @tags = Tag.alphabetically
    switch_to_admin_layout
  end

  def edit
    @tag = Tag.find(params[:id])
    switch_to_admin_layout
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, notice: t('tags.update.notice')
    else
      render action: "edit", warning: t('tags.update.warning'), layout: 'admin'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end

end
