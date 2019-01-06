class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :destroy]

  def index
    if params[:s_class].exist?
      @ships = Ship.all
    else
      @ships = Ship.all.select do |ship|
        ship[:s_class] == params[:s_class]
      end
    end
    # raise
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.save
    redirect_to ships_path
  end

  def show
  end

  # def frigates
  #   # @ships = Ship.all
  #   @category = params[:s_class]
  # end

  private

  def ship_params
    params.require(:ship).permit(:name, :s_class, :notes)
  end

  def set_ship
    @ship = Ship.find(params[:id])
  end

end
