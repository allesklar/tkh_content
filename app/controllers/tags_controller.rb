class TagsController < ApplicationController

  before_filter :authenticate
  before_action -> { require_permission_to 'write_pages'}

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
      flash[:warning] = t('tags.update.warning')
      render action: "edit", layout: 'admin'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_url, notice: 'The tag has been removed'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end

end
