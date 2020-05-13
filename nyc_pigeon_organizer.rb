def nyc_pigeon_organizer(data) 
  new_hash = {}
  name_list = []
  data_type_list = []
  data.each_pair do |data_type, hash|
    hash.each_pair do |feature, array|
      array.each do |name|
        if !name_list.include?(name)
          new_hash.store(name, {data_type => [feature.to_s]})
          name_list.push(name)

        elsif !new_hash[name].has_key?(data_type)
          new_hash[name].store(data_type, [feature.to_s])
          data_type_list.push(data_type) 
        else
          new_hash[name][data_type].push(feature.to_s)
        end
      end
    end
  end
  new_hash
end
