# frozen_string_literal: true

require "rails_helper"

RSpec.describe Music, type: :system do
  describe "曲を検索" do
    before do
      visit search_musics_path
    end

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
end
