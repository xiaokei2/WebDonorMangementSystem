require "rails_helper"

=begin
RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:mail) { UserMailer.account_activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      # expect(mail.to).to eq(["to@example.org"])
      # expect(mail.from).to eq(["no-reply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hi")
    end
  end

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset }

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      # expect(mail.to).to eq(["to@example.org"])
      # expect(mail.from).to eq(["no-reply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hi")
    end
  end

end
=end