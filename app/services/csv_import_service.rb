require 'csv'

class CsvImportService
  attr_accessor :file, :user

  def initialize(csv_file, user)
    @file = csv_file
    @user = user
  end

  def perform
    friends = []
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      row = row.to_h
      data_hash = {}
      data_hash[:user_id] = user.id
      data_hash[:name] = row[:name].to_s
      data_hash[:email] = row[:email].to_s
      data_hash[:dob] = row[:dob]
      friends << data_hash
    end
    Friend.import(friends)
  rescue => e
    return false, e.message
  end
end
