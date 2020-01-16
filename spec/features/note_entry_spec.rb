feature 'title_page' do
  scenario 'check title and text was added' do
    visit '/'
    fill_in :title, with: 'first note'
    fill_in :body, with: 'text body'
    click_button 'Add'
    expect(page).to have_content ('note added to diary')
  end
end