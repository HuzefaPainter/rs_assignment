class ProgramDaysController < ApplicationController
  before_action :set_program_day, only: %i[ show edit update destroy ]

  def current_day_data
    user_id = params[:user_id]
    program_id = params[:program_id]

    program = Program.find(program_id)

    begin
      user_program = UserProgram.find(user_id:, program_id:)
    rescue
      error_with_message("Please enroll for the program first")
    end

    # If international datetime then convert to local time as well
    # based on user data
    started = user_program.start_date.beginning_of_day
    today = Time.now.beginning_of_day
    days_passed = ((today - started).to_i/1.day).floor
    program_day = ProgramDay.find_by(program_id:, day: days_passed + 1)
    day_activities = DayActivity.get_activities(program_day.id)
    day_activity_ids = day_activities.collect { |x| x.day_activity_id }
    completed_activities = UserActivityCompletion.get_completed_day_activity_ids(user_id, day_activity_ids)
    ok_with_data({
      activities: day_activities.map do |da|
        {
          id: da.id,
          title: da.title,
          duration: da.duration,
          frequency: da.frequency,
          category: da.category_title,
          completed: completed_activities.include?(da.day_activity_id)
        }
      end
    })
  end

  def get_day_data
    user_id = params[:user_id]
    program_id = params[:program_id]
    program_day_id = params[:program_day_id]

    begin
      user_program = UserProgram.find_by(user_id:, program_id:)
    rescue
      return error_with_message("Please enroll for the program first (debug link: localhost:3000/admin/users/:user_id/enroll_to_program/:program_id")
    end

    day_activities = DayActivity.get_activities(program_day_id)
    day_activity_ids = day_activities.collect { |x| x.day_activity_id }
    completed_activities = UserActivityCompletion.get_completed_day_activity_ids(user_id, day_activity_ids)

    # TODO: To make this faster can combine both queries together and use
    # postgres jsonb based query to get entire individual activity data
    # with its completion status in a single query

    ok_with_data({
      activities: day_activities.map do |da|
        # Could make a serializer to avoid duplicates for app side data of activities
        {
          id: da.id,
          title: da.title,
          # Assuming app converts duration seconds to minutes if and when required
          # Else just render the text "5 mins" etc here and send to avoid
          # app build updates
          duration: da.duration,
          # Assuming frequency is just user sided text, since the provided table
          # didnt make sense w.r.t frequency, for ex. 3 times a week had checkmarks
          # for day 1, 4, and 7. This would lead to 4 days having back to back the
          # same activity, which maybe destroys the purpose of having gaps.
          # Also, frequency could be its own model if needed for UI purposes.
          # Seems like the app screenshot has various colors for the different
          # frequencies. But some "Maximise" have the same color. So unsure
          # about that as well. Did not have enough time to implement this
          # anyways :/
          frequency: da.frequency,
          category: da.category_title,
          completed: completed_activities.include?(da.day_activity_id)
        }
      end
    })
  end

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
