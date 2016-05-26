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
