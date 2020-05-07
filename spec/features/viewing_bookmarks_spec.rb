feature 'User can view list of bookmarks' do
  scenario 'User views homepage' do
    empty_table
    Bookmarks.create(url: 'www.google.com', title: 'Google')
    Bookmarks.create(url: 'www.facebook.com', title: 'Facebook')
    Bookmarks.create(url: 'www.netflix.com', title: 'Netflix')
    # con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    # rs = con.exec "SELECT url FROM bookmarks"

    # rs.each do |row|
    #   expect(page).to have_content row['url']
    # end
    visit('/bookmarks')
    expect(page).to have_link('Google', href: "http://www.google.com")
    expect(page).to have_link('Facebook', href: "http://www.facebook.com")
    expect(page).to have_link('Netflix', href: "http://www.netflix.com")
  end
end
