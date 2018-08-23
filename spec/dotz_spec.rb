
describe 'Login', :smoke do
  before(:each) do
    visit '/'
  end

  it('pre home', :smoke) do |e|
    expect(page).to have_content 'São Paulo'
  end

  it('home SP', :smoke) do
    click_link 'São Paulo'
  end

  it('home Sorocaba', :smoke) do
    click_link 'Sorocaba'
  end
end
