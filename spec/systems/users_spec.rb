# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :system do
  let!(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe "ユーザーCRUD処理" do
    describe "ユーザー新規登録" do
      before do
        visit new_user_registration_path
      end

      context "正常な値" do
        it "ユーザーの新規登録が成功" do
          fill_in "user_name", with: "TestName"
          fill_in "user_email", with: "test@example.com"
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          click_button "新しいアカウントを作成"
          expect(current_path).to eq root_path
          expect(page).to have_content "アカウント登録が完了しました。"
        end
      end

      context "nameが空白" do
        it "ユーザーの新規登録が失敗" do
          fill_in "user_name", with: ""
          fill_in "user_email", with: "test@example.com"
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          click_button "新しいアカウントを作成"
          expect(current_path).to eq user_registration_path
          expect(page).to have_content "名前を入力してください"
        end
      end

      context "emailが空白" do
        it "ユーザーの新規登録が失敗" do
          fill_in "user_name", with: "TestName"
          fill_in "user_email", with: ""
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          click_button "新しいアカウントを作成"
          expect(current_path).to eq user_registration_path
          expect(page).to have_content "メールアドレスを入力してください"
        end
      end

      context "emailが重複" do
        it "ユーザーの新規登録が失敗" do
          fill_in "user_name", with: "TestName"
          fill_in "user_email", with: user.email
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          click_button "新しいアカウントを作成"
          expect(current_path).to eq user_registration_path
          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end
    end

    describe "ユーザー編集" do
      before do
        visit user_session_path
        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        click_button "ログインする"
        visit edit_user_registration_path
      end

      context "正常な値" do
        it "ユーザーの編集が成功" do
          fill_in "user_name", with: "OtherName"
          fill_in "user_email", with: "test@example.com"
          fill_in "user_current_password", with: user.password
          click_button "更新する"
          expect(current_path).to eq root_path
          expect(page).to have_content "アカウント情報を変更しました。"
        end
      end

      context "nameが空白" do
        it "ユーザーの編集が失敗" do
          fill_in "user_name", with: ""
          fill_in "user_email", with: user.email
          fill_in "user_current_password", with: user.password
          click_button "更新する"
          expect(current_path).to eq user_registration_path
          expect(page).to have_content "名前を入力してください"
        end
      end

      context "emailが空白" do
        it "ユーザーの編集が失敗" do
          fill_in "user_name", with: user.name
          fill_in "user_email", with: ""
          fill_in "user_current_password", with: user.password
          click_button "更新する"
          expect(current_path).to eq user_registration_path
          expect(page).to have_content "メールアドレスを入力してください"
        end
      end

      describe "パスワード変更" do
        context "正常な値" do
          it "パスワードの変更が成功" do
            fill_in "user_name", with: user.name
            fill_in "user_email", with: user.email
            fill_in "user_password", with: "OtherPassword"
            fill_in "user_password_confirmation", with: "OtherPassword"
            fill_in "user_current_password", with: user.password
            click_button "更新する"
            expect(current_path).to eq root_path
            expect(page).to have_content "アカウント情報を変更しました。"
          end
        end

        context "変更後パスワードと確認用パスワードが不一致" do
          it "パスワードの変更が失敗" do
            fill_in "user_name", with: user.name
            fill_in "user_email", with: user.email
            fill_in "user_password", with: "OtherPassword"
            fill_in "user_password_confirmation", with: "TestPassword"
            fill_in "user_current_password", with: user.password
            click_button "更新する"
            expect(current_path).to eq user_registration_path
            expect(page).to have_content "パスワードの入力が一致しません"
          end
        end

        context "現在のパスワードが空白" do
          it "パスワードの変更が失敗" do
            fill_in "user_name", with: user.name
            fill_in "user_email", with: user.email
            fill_in "user_password", with: "OtherPassword"
            fill_in "user_password_confirmation", with: "OtherPassword"
            fill_in "user_current_password", with: ""
            click_button "更新する"
            expect(current_path).to eq user_registration_path
            expect(page).to have_content "現在のパスワードを入力してください"
          end
        end
      end
    end
  end
end
