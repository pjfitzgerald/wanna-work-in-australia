
# can copy/paste this into rails c for quick execution


File.open('region_info.txt', 'a') {|f| f.write("STATE | REGION-NAME\n")}
Region.all.each do |region|
  File.open('region_info.txt', 'a') {|f| f.write("#{region.state} | #{region.name}\n")}
end


File.open('region_info.txt', 'a') {|f| f.write("\nregions with missing descriptions/spiels:\n")}

Region.where(description: nil).each do |region|
  File.open('region_info.txt', 'a') {|f| f.write("#{region.state} | #{region.name}\n")}
end

