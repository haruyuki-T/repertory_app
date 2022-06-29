# frozen_string_literal: true

require "rails_helper"

RSpec.describe Music, type: :system do
  let!(:user) { create(:user) }
  let!(:scene) { create(:scene, :a) }

  before do
    visit user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "ログインする"
    visit search_musics_path
  end

  describe "曲を検索" do
    context "正常な値" do
      it "検索ワードが含まれる結果を表示" do
        fill_in "search", with: "東京"
        click_button "検索"
        expect(page).to have_content "東京"
      end

      it "検索ワードから予測される結果を表示" do
        fill_in "search", with: "ミスチル"
        click_button "検索"
        expect(page).to have_content "Mr.Children"
      end
    end

    context "空白" do
      it "何も表示されない" do
        fill_in "search", with: ""
        click_button "検索"
        expect(page).not_to have_selector("result")
      end
    end
  end

  describe "曲をレパートリーに追加" do
    it "「未分類」カラムに追加される" do
      fill_in "search", with: "東京"
      click_button "検索"
      expect { click_on "追加する", match: :first }.to change(Post, :count).by(1)
      expect(page).to have_selector(".notice", text: "曲を追加しました。")
    end
  end
end
