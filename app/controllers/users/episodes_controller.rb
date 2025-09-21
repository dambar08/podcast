class Users::EpisodesController < Users::ManagementController
  before_action :set_episode, only: %i[ show edit update destroy ]

  # GET /users/episodes or /users/episodes.json
  def index
    set_current_tab("episodes")
    @episodes = Episode.all
  end

  # GET /users/episodes/1 or /users/episodes/1.json
  def show
  end

  # GET /users/episodes/new
  def new
    @episode = Episode.new
  end

  # GET /users/episodes/1/edit
  def edit
  end

  # POST /users/episodes or /users/episodes.json
  def create
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to [ :users, @episode ], notice: "Episode was successfully created." }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def skip_audio_file
    @episode = Episode.new(user: Current.user)
    respond_to do |format|
      if @episode.save
        format.html { redirect_to edit_user_users_episode_path(id: @episode.id) }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/episodes/1 or /users/episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to [ :user, :users, @episode ], notice: "Episode was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/episodes/1 or /users/episodes/1.json
  def destroy
    @episode.destroy!

    respond_to do |format|
      format.html { redirect_to user_users_episodes_path, notice: "Episode was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def episode_params
      params.fetch(:episode, {})
    end
end
