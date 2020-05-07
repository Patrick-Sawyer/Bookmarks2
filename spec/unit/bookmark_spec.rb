require 'bookmarks'
require 'database_helpers'

describe Bookmarks do
  # it "shows a list of URL's" do
  #   empty_table
  #   Bookmarks.create(url: 'www.google.com')
  #   Bookmarks.create(url: 'www.facebook.com')
  #   Bookmarks.create(url: 'www.netflix.com')
  #   bookmarks = ["www.google.com", "www.facebook.com", "www.netflix.com"]
  #   expect(Bookmarks.all).to eq(bookmarks)
  # end


  describe '.create' do 
    it 'creates new bookmark' do
      bookmark = Bookmarks.create(url: 'www.testestest.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'www.testestest.com'
    end
  end

  describe '.all' do 
    it 'returns a list of bookmarks' do 
      empty_table
      bookmark = Bookmarks.create(url: 'www.google.com', title: 'Google')
      Bookmarks.create(url: 'www.facebook.com', title: 'Facebook')
      Bookmarks.create(url: 'www.netflix.com', title: 'Netflix')
      bookmarks = Bookmarks.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'www.google.com'
    end
  end

  describe '.delete' do 
    it 'deletes the given bookmark' do 
      bookmark = Bookmarks.create(url: 'www.Makersacademy.com', title: 'Makers Academy')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.all.length).to eq 0

    end 
  end 
end
