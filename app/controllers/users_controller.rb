class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # Could use Devise for user auth, for now just using id for apis

  def enroll_to_program
    user_id = params[:user_id]
    program_id = params[:program_id]
    # If we want to choose the start date, say they have bought this program
    # before childbirth, then we could choose one via params and set a nightly
    # routine to activate all plans with todays start date
    begin
      user_program = UserProgram.new(user_id:, program_id:, start_date: Time.now, active: true)
      user_program.save
      ok_with_data({ message: "Successfully enrolled for the program" })
    rescue
      # If we want to allow multiple enrollments, say a second child,
      # then we must remove the unique user -> program key. And then also
      # check the latest enrollment for active: true
      error_with_message("You have already enrolled for this program.")
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :name, :email ])
    end
end
