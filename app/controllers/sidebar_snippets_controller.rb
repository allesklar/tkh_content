class SidebarSnippetsController < ApplicationController

  before_filter :authenticate
  before_action -> { require_permission_to 'write_pages'}

  def index
    @sidebar_snippet = SidebarSnippet.first
    switch_to_admin_layout
  end

  def edit
    @sidebar_snippet = SidebarSnippet.first
    switch_to_admin_layout
  end

  def update
    @sidebar_snippet = SidebarSnippet.first
    if @sidebar_snippet.update_attributes(sidebar_snippet_params)
      redirect_to sidebar_snippets_path, notice: t('sidebar_snippets.update.notice')
    else
      render action: "edit", warning: t('sidebar_snippets.update.warning')
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def sidebar_snippet_params
    params.require(:sidebar_snippet).permit :main_sidebar, :blog_sidebar
  end
end
