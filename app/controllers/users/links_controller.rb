class Users::LinksController < ApplicationController
  before_action :set_link, only: %i[ show edit update destroy ]

  # GET /users/links or /users/links.json
  def index
    @links = Link.all
  end

  # GET /users/links/1 or /users/links/1.json
  def show
  end

  # GET /users/links/new
  def new
    @link = Link.new
  end

  # GET /users/links/1/edit
  def edit
  end

  # POST /users/links or /users/links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to [:users, @link], notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/links/1 or /users/links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to [:users, @link], notice: "Link was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/links/1 or /users/links/1.json
  def destroy
    @link.destroy!

    respond_to do |format|
      format.html { redirect_to users_links_path, notice: "Link was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.fetch(:link, {})
    end
end
