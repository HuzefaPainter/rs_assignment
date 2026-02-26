class DayActivitiesController < ApplicationController
  before_action :set_day_activity, only: %i[ show edit update destroy ]

  # GET /day_activities or /day_activities.json
  def index
    @day_activities = DayActivity.all
  end

  # GET /day_activities/1 or /day_activities/1.json
  def show
  end

  # GET /day_activities/new
  def new
    @day_activity = DayActivity.new
  end

  # GET /day_activities/1/edit
  def edit
  end

  # POST /day_activities or /day_activities.json
  def create
    @day_activity = DayActivity.new(day_activity_params)

    respond_to do |format|
      if @day_activity.save
        format.html { redirect_to @day_activity, notice: "Day activity was successfully created." }
        format.json { render :show, status: :created, location: @day_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @day_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_activities/1 or /day_activities/1.json
  def update
    respond_to do |format|
      if @day_activity.update(day_activity_params)
        format.html { redirect_to @day_activity, notice: "Day activity was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @day_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @day_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_activities/1 or /day_activities/1.json
  def destroy
    @day_activity.destroy!

    respond_to do |format|
      format.html { redirect_to day_activities_path, notice: "Day activity was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_activity
      @day_activity = DayActivity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def day_activity_params
      params.expect(day_activity: [ :program_day_id, :activity_id, :sort_order, :integer ])
    end
end
