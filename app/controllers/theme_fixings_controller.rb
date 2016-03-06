class ThemeFixingsController < ApplicationController
  def create
    @theme_fixing = ThemeFixing.new(theme_fixing_params)
    if @theme_fixing.save
      redirect_to fest_path(@theme_fixing.theme.fest)
    elsif @theme_fixing.theme
      redirect_to fest_path(@theme_fixing.theme.fest)
    else
      redirect_to fests_path
    end
  end

  private

  def theme_fixing_params
    params.permit(:theme_id).to_h
  end
end
