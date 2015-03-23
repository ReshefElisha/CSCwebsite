require 'rubygems'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Messages
  include DataMapper::Resource
  property :id          Serial
  property :poster,     String
  property :text,       String
end

DataMapper.finalize
DataMapper.auto_upgrade!
Messages.auto_upgrade!