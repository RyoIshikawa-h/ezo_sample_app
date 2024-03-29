require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    it 'renders the headers and body' do
      user = create(:user)
      user.activation_token = User.new_token
      mail = UserMailer.account_activation(user)

      expect(mail.subject).to eq('Account activation')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['user@realdomain.com'])
      expect(mail.body).to match(user.name)
      expect(mail.body).to match(user.activation_token)
      expect(mail.body).to match(CGI.escape(user.email))
    end
  end

  describe 'password_reset' do
    it 'renders the headers and body' do
      user = create(:user)
      user.reset_token = User.new_token
      mail = UserMailer.password_reset(user)

      expect(mail.subject).to eq('Password reset')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['user@realdomain.com'])
      expect(mail.body).to match(user.reset_token)
      expect(mail.body).to match(CGI.escape(user.email))
    end
  end
end


# require "rails_helper"

# RSpec.describe UserMailer, type: :mailer do
#   describe "account_activation" do
#     let(:mail) { UserMailer.account_activation }

#     it "renders the headers" do
#       expect(mail.subject).to eq("Account activation")
#       expect(mail.to).to eq(["to@example.org"])
#       expect(mail.from).to eq(["clas.warehouse@gmail.com"])
#     end

#     it "renders the body" do
#       expect(mail.body.encoded).to match("Hi")
#     end
#   end

#   describe "password_reset" do
#     let(:mail) { UserMailer.password_reset }

#     it "renders the headers" do
#       expect(mail.subject).to eq("Password reset")
#       expect(mail.to).to eq(["to@example.org"])
#       expect(mail.from).to eq(["clas.warehouse@gmail.com"])
#     end

#     it "renders the body" do
#       expect(mail.body.encoded).to match("Hi")
#     end
#   end

# end
