require 'sinatra'
get '/lookup' do
  content_type :json
  if params[:first_name] == 'Aaron' && params[:last_name] == 'Huttner'
    '{"voter_records_response":{"registration_success":{"action":"registration-matched","voter_registration":{"registration_address":{"numbered_thoroughfare_address":{"complete_address_number":{"address_number":"123"},"complete_street_name":{"street_name":"Walnut","street_name_post_type":"Avenue","street_name_post_directional":"Northwest"},"complete_sub_address":{"sub_address_type":"APT","sub_address":"#2"},"complete_place_names":[{"place_name_type":"MunicipalJurisdiction","place_name_value":"Stittsville"},{"place_name_type":"County","place_name_value":"Carleton"}],"state":"Ontario","zip_code":"K2M3C4"}},"registration_address_is_mailing_address":true,"name":{"first_name":"Aaron","last_name":"Huttner","middle_name":"Bernard","title_prefix":"Mr","title_suffix":"Jr"},"gender":"male","voter_ids":[{"type":"drivers_license","attest_no_such_id":false},{"type":"other","othertype":"elector_id","string_value":"1234","attest_no_such_id":false}],"voter_classifications":[{"Assertion":"true","Type":"Other","OtherType":"citizen"},{"Assertion":"true","Type":"Other","OtherType":"resident-of-ontario"}],"contact_methods":[{"type":"phone","value":"555-555-5555","capabilities":["voice","fax","sms"]},{"type":"email","value":"xyz@gmail.com"}]}}}}'
  elsif params[:first_name] == 'X'
    [500, 'Emulated internal server error']
  else
    '{"no_match": true}'
  end
end
