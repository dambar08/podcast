class Users::NotificationsController < Users::ManagementController
  before_action :set_notification, only: %i[ show edit update destroy ]

  # GET /users/notifications or /users/notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /users/notifications/1 or /users/notifications/1.json
  def show
  end

  # GET /users/notifications/new
  def new
    @notification = Notification.new
  end

  # GET /users/notifications/1/edit
  def edit
  end

  # POST /users/notifications or /users/notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to [ :users, @notification ], notice: "Notification was successfully created." }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/notifications/1 or /users/notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to [ :users, @notification ], notice: "Notification was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/notifications/1 or /users/notifications/1.json
  def destroy
    @notification.destroy!

    respond_to do |format|
      format.html { redirect_to users_notifications_path, notice: "Notification was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.fetch(:notification, {})
    end
end
