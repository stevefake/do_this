# Prefix class methods with a '.'
describe User, '.active' do
  it 'returns only active users' do
    # setup
    active_user = create(:user, active: true)
    non_active_user = create(:user, active: false)

    # exercise
    result = User.active

    # verify
    expect(result).to eq [active_user]

    # teardown is handled for you by RSpec
  end
end

# Prefix instance methods with a '#'
describe User, '#name' do
  it 'returns the concatenated first and last name' do
    # setup
    user = build(:user, first_name: 'Josh', last_name: 'Steiner')

    # excercise and verify
    expect(user.name).to eq 'Josh Steiner'
  end
end

describe User do
  describe "#send_password_reset" do
    let(:user) { Factory(:user) }

    it "generates a unique password_reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end
end
