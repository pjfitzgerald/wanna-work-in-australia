require 'csv'
require './app/models/venue'

def venue_suburb_export(file_path)
  csv_options = { col_sep: '|', quote_char: '"', headers: :first_row, header_converters: :symbol }
  suburbs = []
  CSV.foreach(file_path, csv_options) do |row|
    split_address = row[:address].split('; ')
    raw_suburb = split_address[1]
    suburbs << raw_suburb
  end
  return suburbs
end

# venue_suburb_export('venue_import.csv')

def csv_write(original_file, return_file, banners)
  csv_options = { col_sep: '|', headers: :first_row, header_converters: :symbol }
  table = CSV.read(original_file, csv_options)
  table[:banner] = banners
  CSV.open(return_file, 'w', csv_options) do |f|
    f << table.headers
    table.each{ |row| f << row }
  end
end


def venue_banners_export
  banners = []
  x = 1
  until x > 53 do
    random_banner = Region.order('RANDOM()').first.banner
    if !random_banner.nil?
      banners << random_banner
      x += 1
    end
  end
  return banners
end




csv_write('venue_import.csv', 'venue_import_copy.csv', venue_banners_export)