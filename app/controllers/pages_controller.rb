class PagesController < ApplicationController
  
  before_filter :authenticate,            :except => 'show'
  before_filter :authenticate_with_admin, :except => 'show'
  
  def index
    @pages = Page.by_recent
    switch_layout_to_admin
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    switch_layout_to_admin
  end

  def edit
    @page = Page.find(params[:id])
    switch_layout_to_admin
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => 'Page was successfully created.'
    else
      render action: "new", warning: 'There was a problem saving the page', layout: 'admin'
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice => 'Page was successfully updated.'
    else
      render action: "edit", warning: 'The was a problem saving the page', layout: 'admin'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url
  end
  
end
