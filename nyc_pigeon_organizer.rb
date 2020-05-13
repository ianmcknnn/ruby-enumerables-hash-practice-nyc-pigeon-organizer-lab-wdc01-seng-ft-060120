def nyc_pigeon_organizer(data) 
  #initializing a hash, a name array, and a data_type_list to which to add
  #things as we see them in the loops 
  new_hash = {}
  name_list = []
  data_type_list = []
  #loop through the hash of data-types
  data.each_pair do |data_type, hash|
    #loop through the hash of features
    hash.each_pair do |feature, array|
      #loop through the array of names
      array.each do |name|
        #if we have never seen a name before, add it to the name list so we
        #don't overwrite it next time we want to store something for that
        #name, then store the name key with the data-type, feature array
        #value pair
        if !name_list.include?(name)
          new_hash.store(name, {data_type => [feature.to_s]})
          name_list.push(name)
        #if we have seen the name, but not the data_type (color, gender,
          #or place), store the data type key with the feature value
        elsif !new_hash[name].has_key?(data_type)
          new_hash[name].store(data_type, [feature.to_s])
          data_type_list.push(data_type) 
          #if none of the above are true, we must have seen both the name
          #and data type before, so just push the feature to the feature
          #array that already exists for the given name and data-type
        else
          new_hash[name][data_type].push(feature.to_s)
        end
      end
    end
  end
  #print the new hash
  new_hash
end
