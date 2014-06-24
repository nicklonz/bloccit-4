class UserfidsController < ApplicationController
  before_action :set_userfid, only: [:show, :edit, :update, :destroy]

  # GET /userfids
  # GET /userfids.json
  def index
    @userfids = Userfid.all
  end

  # GET /userfids/1
  # GET /userfids/1.json
  def show
  end

  # GET /userfids/new
  def new
    @userfid = Userfid.new
  end

  # GET /userfids/1/edit
  def edit
  end

  # POST /userfids
  # POST /userfids.json
  def create
    @userfid = Userfid.new(userfid_params)

    respond_to do |format|
      if @userfid.save
        format.html { redirect_to @userfid, notice: 'Userfid was successfully created.' }
        format.json { render :show, status: :created, location: @userfid }
      else
        format.html { render :new }
        format.json { render json: @userfid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userfids/1
  # PATCH/PUT /userfids/1.json
  def update
    respond_to do |format|
      if @userfid.update(userfid_params)
        format.html { redirect_to @userfid, notice: 'Userfid was successfully updated.' }
        format.json { render :show, status: :ok, location: @userfid }
      else
        format.html { render :edit }
        format.json { render json: @userfid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userfids/1
  # DELETE /userfids/1.json
  def destroy
    @userfid.destroy
    respond_to do |format|
      format.html { redirect_to userfids_url, notice: 'Userfid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userfid
      @userfid = Userfid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userfid_params
      params.require(:userfid).permit(:name, :slug)
    end
end
