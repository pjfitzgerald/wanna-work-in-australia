require 'csv'


def csv_manipulation(file_path)
  csv_options = { col_sep: '|', quote_char: '"', headers: :first_row, header_converters: :symbol }
  suburbs = []
  CSV.foreach(file_path, csv_options) do |row|
    split_address = row[:address].split('; ')
    raw_suburb = split_address[1]
    suburbs << raw_suburb
  end
  return suburbs
end

# csv_manipulation('venue_import.csv')

def csv_write(original_file, return_file, suburbs)
  csv_options = { col_sep: '|', headers: :first_row, header_converters: :symbol }
  table = CSV.read(original_file, csv_options)
  table[:suburb] = suburbs
  CSV.open(return_file, 'w', csv_options) do |f|
    f << table.headers
    table.each{ |row| f << row }
  end
end

csv_write('venue_import.csv', 'venue_import_copy.csv', csv_manipulation('venue_import.csv'))