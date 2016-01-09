class ThemePublicationsController < ApplicationController
  def create
    @theme_publication = ThemePublication.new(theme_publication_params)
    if @theme_publication.save
      redirect_to fest_path(@theme_publication.theme.fest)
    elsif @theme_publication.theme
      redirect_to fest_path(@theme_publication.theme.fest)
    else
      redirect_to fests_path
    end
  end

  private

  def theme_publication_params
    params.permit(:theme_id).to_h
  end
end
