feature 'Enter names' do
  scenario 'submitting names' do
  visit('/')
  fill_in :player_1_name, with: "Will"
  fill_in :player_2_name, with: "Paula"
  click_button 'Submit'
  
  expect(page).to have_content 'Will vs. Paula'
  end
end