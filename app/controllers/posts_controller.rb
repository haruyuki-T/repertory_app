# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
    @default_scene = Post.where(scene_id: 1).order(:artist_name)
    @same_age_scene = Post.where(scene_id: 2).order(:artist_name)
    @boss_scene = Post.where(scene_id: 3).order(:artist_name)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "曲を追加しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def post_params
      params.permit(:user_id, :scene_id, :artist_name, :song_title)
    end
end
