class JobBoardsController < ApplicationController
  before_action :set_job_board, only: [:show, :edit, :update, :destroy]

  # GET /job_boards
  # GET /job_boards.json
  def index
    @board = JobBoard.offset(rand(JobBoard.count-1)).first
    redirect_to @board
  rescue
    # no boards here, we need to run a fixture...
    # So we do nothing and render the page
  end

  # GET /job_boards/1
  # GET /job_boards/1.json
  def show
  end

  # GET /job_boards/new
  def new
    @job_board = JobBoard.new
  end

  # GET /job_boards/1/edit
  def edit
  end

  # POST /job_boards
  # POST /job_boards.json
  def create
    @job_board = JobBoard.new(job_board_params)

    respond_to do |format|
      if @job_board.save
        format.html { redirect_to @job_board, notice: 'Job board was successfully created.' }
        format.json { render :show, status: :created, location: @job_board }
      else
        format.html { render :new }
        format.json { render json: @job_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_boards/1
  # PATCH/PUT /job_boards/1.json
  def update
    respond_to do |format|
      if @job_board.update(job_board_params)
        format.html { redirect_to @job_board, notice: 'Job board was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_board }
      else
        format.html { render :edit }
        format.json { render json: @job_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_boards/1
  # DELETE /job_boards/1.json
  def destroy
    @job_board.destroy
    respond_to do |format|
      format.html { redirect_to job_boards_url, notice: 'Job board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_board
      @job_board = JobBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_board_params
      params.require(:job_board).permit(:level)
    end
end
