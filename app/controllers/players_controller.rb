class PlayersController < ApplicationController
  before_action :ensure_player, except: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :no_duplicate_player, only: [:new, :create]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @current_player = Player.find(params[:id])
  rescue
    redirect_to @player
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  # This will always show your own player
  # and #update will always update your own player
  def edit
  end

  # do nothing for now
  # changing player name is not supported
  def update
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    @player.user_id = current_user.id
    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # called when a player submits his current work
  def finish
    @player.finish
    redirect_to job_boards_path
  end

  private

    # Check if this user already has a player
    # requires #authenticate_user! to run before it
    # so that current_user gets populated
    #
    # This filter redirects to the users player if he has one
    def no_duplicate_player
      if current_user.player
        redirect_to current_user.player
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name)
          #.merge(:money => 1.0)
    end
end
