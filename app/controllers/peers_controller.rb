class PeersController < ApplicationController
  before_action :set_peer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /peers or /peers.json
  def index
    @peers = Peer.all
  end

  # GET /peers/1 or /peers/1.json
  def show
  end

  # GET /peers/new
  def new
    @peer = current_user.peers.build
  end

  # GET /peers/1/edit
  def edit
  end

  # POST /peers or /peers.json
  def create
    @peer = current_user.peers.build(peer_params)

    respond_to do |format|
      if @peer.save
        format.html { redirect_to @peer, notice: "Peer was successfully created." }
        format.json { render :show, status: :created, location: @peer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peers/1 or /peers/1.json
  def update
    respond_to do |format|
      if @peer.update(peer_params)
        format.html { redirect_to @peer, notice: "Peer was successfully updated." }
        format.json { render :show, status: :ok, location: @peer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peers/1 or /peers/1.json
  def destroy
    @peer.destroy
    respond_to do |format|
      format.html { redirect_to peers_url, notice: "Peer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @peer = current_user.peers.find_by(id: params[:id])
    redirect_to peers_path, notice: "Not Authorized to mess with other's peers" if @peer.nil?
  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer
      @peer = Peer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peer_params
      params.require(:peer).permit(:username, :email, :religion, :user_id)
    end
end
