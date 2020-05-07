require_relative '../lib/bookmarks.rb'
require 'pg'

def empty_table
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    rs = con.exec "TRUNCATE TABLE bookmarks;"
end

