class ProgramDaysController < ApplicationController
  before_action :set_program_day, only: %i[ show edit update destroy ]

  # GET /program_days or /program_days.json
  def index
    @program_days = ProgramDay.all
  end

  # GET /program_days/1 or /program_days/1.json
  def show
  end

  # GET /program_days/new
  def new
    @program_day = ProgramDay.new
  end

  # GET /program_days/1/edit
  def edit
  end

  # POST /program_days or /program_days.json
  def create
    @program_day = ProgramDay.new(program_day_params)

    respond_to do |format|
      if @program_day.save
        format.html { redirect_to @program_day, notice: "Program day was successfully created." }
        format.json { render :show, status: :created, location: @program_day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_days/1 or /program_days/1.json
  def update
    respond_to do |format|
      if @program_day.update(program_day_params)
        format.html { redirect_to @program_day, notice: "Program day was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @program_day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_days/1 or /program_days/1.json
  def destroy
    @program_day.destroy!

    respond_to do |format|
      format.html { redirect_to program_days_path, notice: "Program day was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_day
      @program_day = ProgramDay.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def program_day_params
      params.expect(program_day: [ :program_id, :day ])
    end
end
