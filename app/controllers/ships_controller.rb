class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :destroy]

  def index
    ship_classes = Ship.pluck(:s_class)
    proper_class_downcase = params[:s_class].try(:downcase)
    if ship_classes.include?(proper_class_downcase)
      @ships = Ship.where(s_class: proper_class_downcase)
    else
      @ships = Ship.all
    end

    # params_match = ship_classes.include?(check)
    # @ships = Ship.all
    # if params[:s_class].exist?
      # @ships = Ship.where(s_class: params[:s_class])
    #   @ships = Ship.where(s_class: "frigate")
    # else
    #   @ships = Ship.all
    # end

    # This works to downcase the s_class from params to check
    # Need raise because errors go up with local variables if I leave them there
    # raise
    # @ships = Ship.where(s_class: "Frigate")
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

  def edit
  end

  def update
    @ship = Ship.find(params[:id])
  end

  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy
    redirect_to ships_path
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
