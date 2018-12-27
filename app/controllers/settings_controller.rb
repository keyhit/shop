class SettingsController < ApplicationController
  def index
    @setting = {}
    pairs = Setting.pluck(:set_key, :set_value)
    pairs.each { |key, value| @setting[key] = value }
    @setting
  end

  def all_settings
    @settings = Setting.all
  end

  def new
    @setting = Setting.new
  end

  def create
    if Setting.create(setting_params)
      redirect_to all_settings_path, notice: 'Settings created.'
    end
  end

  def edit
  @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update(setting_params)
      redirect_to all_settings_path, notice: 'Settings updated.'
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    if @setting.destroy
      redirect_to all_settings_path, notice: 'Settings deleted.'
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:set_key, :set_value)
  end
end
