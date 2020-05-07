feature 'adding a bookmark' do 
  scenario 'A user can add a bookmark to Bookmark Manager' do 
    visit('/bookmarks/new')
    fill_in('url', with: 'www.gmail.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: "http://www.gmail.com")
  end
end