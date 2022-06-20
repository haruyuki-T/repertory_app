# frozen_string_literal: true

class MusicsController < ApplicationController
  require "rspotify"
  ENV['ACCEPT_LANGUAGE'] = "ja"
  RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_SECRET_ID"])

  def search
    @musics = Music.all
    if params[:search].present?
      @searchtracks = RSpotify::Track.search(params[:search])
    end
  end

  def show
    @track = RSpotify::Track.find(params[:id])
  end
end
