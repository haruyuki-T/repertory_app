# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :system do
  let(:user) { create(:user) }
  let!(:scene) { create(:scene, :a) }
  let!(:scene_2) { create(:scene, :b) }
  let!(:scene_3) { create(:scene, :c) }
  let!(:post) { create(:post, user_id: user.id) }
  let!(:post_2) { create(:post, user_id: user.id, scene_id: 2) }
  let!(:post_3) { create(:post, user_id: user.id, scene_id: 3) }

  before do
    visit user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "ログインする"
    visit edit_post_path(user.id)
  end

  describe "レパートリーの分類を変更" do
    context "「未分類」の場合" do
      it "「同年代」へ変更" do
        within page.all("ul")[1] do
          select "同年代", from: "post_scene_id"
          click_on "変更"
        end
        within page.all("ul")[2] do
          expect(page).to have_content post.song_title
          expect(page).to have_content post.artist_name
        end
      end

      it "「上司」へ変更" do
        within page.all("ul")[1] do
          select "上司", from: "post_scene_id"
          click_on "変更"
        end
        within page.all("ul")[3] do
          expect(page).to have_content post.song_title
          expect(page).to have_content post.artist_name
        end
      end
    end

    context "「同年代」の場合" do
      it "「未分類」へ変更" do
        within page.all("ul")[2] do
          select "未分類", from: "post_scene_id"
          click_on "変更"
        end
        within page.all("ul")[1] do
          expect(page).to have_content post.song_title
          expect(page).to have_content post.artist_name
        end
      end

      it "「上司」へ変更" do
        within page.all("ul")[2] do
          select "上司", from: "post_scene_id"
          click_on "変更"
        end
        within page.all("ul")[3] do
          expect(page).to have_content post.song_title
          expect(page).to have_content post.artist_name
        end
      end
    end

    context "「上司」の場合" do
      it "「未分類」へ変更" do
        within page.all("ul")[3] do
          select "未分類", from: "post_scene_id"
          click_on "変更"
        end
        within page.all("ul")[1] do
          expect(page).to have_content post.song_title
          expect(page).to have_content post.artist_name
        end
      end

      it "「同年代」へ変更" do
        within page.all("ul")[3] do
          select "同年代", from: "post_scene_id"
          click_on "変更"
        end
        within page.all("ul")[2] do
          expect(page).to have_content post.song_title
          expect(page).to have_content post.artist_name
        end
      end
    end
  end

  it "レパートリーを削除" do
    expect { click_on "削除", match: :first }.to change(Post, :count).by(-1)
    expect(page).to have_selector(".notice", text: "曲を削除しました。")
  end
end
