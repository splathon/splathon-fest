class ThemesController < ApplicationController
  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to fest_path(params[:fest_id])
    elsif @fest = Fest.find_by(id: params[:fest_id])
      render template: 'fests/show'
    else
      redirect_to fests_path
    end
  end

  private

  def theme_params
    attributes = params.require(:theme).permit(:alpha, :bravo)
    attributes[:fest_id] = params[:fest_id]
    attributes
  end
end
