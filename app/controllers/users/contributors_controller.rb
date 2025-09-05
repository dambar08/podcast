class Users::ContributorsController < ApplicationController
  before_action :set_contributor, only: %i[ show edit update destroy ]

  # GET /users/contributors or /users/contributors.json
  def index
    @contributors = Contributor.all
  end

  # GET /users/contributors/1 or /users/contributors/1.json
  def show
  end

  # GET /users/contributors/new
  def new
    @contributor = Contributor.new
  end

  # GET /users/contributors/1/edit
  def edit
  end

  # POST /users/contributors or /users/contributors.json
  def create
    @contributor = Contributor.new(contributor_params)

    respond_to do |format|
      if @contributor.save
        format.html { redirect_to [:users, @contributor], notice: "Contributor was successfully created." }
        format.json { render :show, status: :created, location: @contributor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/contributors/1 or /users/contributors/1.json
  def update
    respond_to do |format|
      if @contributor.update(contributor_params)
        format.html { redirect_to [:users, @contributor], notice: "Contributor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @contributor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/contributors/1 or /users/contributors/1.json
  def destroy
    @contributor.destroy!

    respond_to do |format|
      format.html { redirect_to users_contributors_path, notice: "Contributor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor
      @contributor = Contributor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contributor_params
      params.fetch(:contributor, {})
    end
end
