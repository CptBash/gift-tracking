# frozen_string_literal: true

# FriendsController
class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[show edit update destroy]

  # GET /friends or /friends.json
  def index
    # only show friends that belong to the current user
    @user = current_user
    @friends = Friend.where(user_id: current_user.id)
  end

  # GET /friends/1 or /friends/1.json
  def show; end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit; end

  # POST /friends or /friends.json
  # rubocop:disable Metrics/MethodLength
  def create # rubocop:disable Metrics/AbcSize
    @friend = Friend.new(friend_params)
    @friend.user_id = current_user.id

    respond_to do |format|
      if @friend.save
        format.html { redirect_to friends_url, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength Metrics/AbcSize

  # PATCH/PUT /friends/1 or /friends/1.json
  def update # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    # update friends gift list to match params, remove any gifts that are no longer in the list
    @friend.gifts.each do |gift|
      unless friend_params[:gifts_attributes].values.any? { |v| v[:name] == gift.name && v[:link] == gift.link }
        gift.destroy
      end
    end

    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    # destroy gifts associated with the friend
    @friend.gifts.destroy_all
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friend
    @friend = Friend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friend_params
    params.require(:friend).permit(:name, :birthday, gifts_attributes: %i[id name price link _destroy])
  end
end
