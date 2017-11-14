# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'rails_helper'

describe User, :type => :model do
  context 'when user is valid' do
    let(:user) { User.new(name: 'Nick', email: 'test@test.com', password: 'foobar', password_confirmation: 'foobar') }

    it { expect(user.valid?).to be_truthy }
  end

  context 'when user name is not valid' do
    context 'when name is not present' do
      let(:user) { User.new(name: '', email: 'test@test.com', password: 'foobar', password_confirmation: 'foobar') }

      it { expect(user.valid?).to be_falsey }
    end

    context 'when user name is to long' do
      let(:user) { User.new(name: 'a' * 51, email: 'test@test.com', password: 'foobar', password_confirmation: 'foobar') }

      it { expect(user.valid?).to be_falsey }
    end
  end

  context 'when email is not valid' do
    context 'when email is not present' do
      let(:user) { User.new(name: 'Nick', email: '', password: 'foobar', password_confirmation: 'foobar') }

      it { expect(user.valid?).to be_falsey }
    end

    context 'when email is to long' do
      let(:user) { User.new(name: 'Nick', email: 'a' * 244 + '@example.com', password: 'foobar', password_confirmation: 'foobar') }

      it { expect(user.valid?).to be_falsey }
    end

    context 'when email is not valid' do
      let(:user) { User.new(name: 'Nick', email: 'test.com', password: 'foobar', password_confirmation: 'foobar') }
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

      it 'asserts bad emails to be invalid' do
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user.valid?).to be_falsey
        end
      end
    end

    context 'when email is not unique' do
      let(:user) { User.new(name: 'Nick', email: 'test@test.com', password: 'foobar', password_confirmation: 'foobar') }
      let(:copied_user) { user.dup }

      before do
        user.save!
      end

      it { expect(copied_user.valid?).to be_falsey }
    end

    context 'when email is not unique with case sensitivity' do
      let(:user) { User.new(name: 'Nick', email: 'foo@example.com', password: 'foobar', password_confirmation: 'foobar') }
      let(:copied_user) { user.dup }

      before do
        user.save!
        copied_user.email = 'foo@example.com'.upcase
      end

      it { expect(copied_user.valid?).to be_falsey }
    end
  end

  context 'when email is valid' do
    context 'email should be saved as lower-case' do
      let(:user) { User.new(name: 'Nick', email: 'Foo@ExAMPle.CoM', password: 'foobar', password_confirmation: 'foobar') }

      before do
        user.save!
      end

      it { expect(user.email).to eq('foo@example.com') }
    end
  end

  context 'when password is not vaild' do
    context 'when password does not have minimum length' do
      let(:user) { User.new(name: 'Nick', email: 'Foo@ExAMPle.CoM', password: 'foo', password_confirmation: 'foo') }

      it { expect(user.valid?).to be_falsey }
    end
  end
end
