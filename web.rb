require 'sinatra'

def param_downcase(name)
  if params[name]
    params[name].downcase
  else
    ''
  end
end

get '/lookup' do
  content_type :json
  if param_downcase(:first_name) == 'wendy' &&
      param_downcase(:last_name) == 'audette' &&
      param_downcase(:dob) == '1968-12-22' &&
      param_downcase(:street_name) == 'george' &&
      param_downcase(:street_number) == '22' &&
      param_downcase(:street_type) == 'street'
    '{"voter_records_response":{"registration_success":{"action":"registration-matched","voter_registration":{"registration_address":{"numbered_thoroughfare_address":{"complete_address_number":{"address_number":"22"},"complete_street_name":{"street_name":"George","street_name_post_type":"Street","street_name_post_directional":""},"complete_sub_address":{"sub_address_type":"APT","sub_address":"#2"},"complete_place_names":[{"place_name_type":"MunicipalJurisdiction","place_name_value":"Stittsville"},{"place_name_type":"County","place_name_value":"Hamilton"}],"state":"Ontario","zip_code":"L0R2H0"}},"registration_address_is_mailing_address":true,"name":{"first_name":"Wendy","last_name":"Audette","middle_name":"M","title_prefix":"Ms","title_suffix":""},"gender":"female","voter_ids":[{"type":"drivers_license","attest_no_such_id":false},{"type":"other","othertype":"elector_id","string_value":"137622","attest_no_such_id":false}],"voter_classifications":[{"Assertion":"true","Type":"Other","OtherType":"citizen"},{"Assertion":"true","Type":"Other","OtherType":"resident-of-ontario"}],"contact_methods":[{"type":"phone","value":"555-555-5555","capabilities":["voice","fax","sms"]},{"type":"email","value":"xyz@gmail.com"}]}}}}'
  elsif params[:first_name] == 'X'
    [500, 'Emulated internal server error']
  else
    '{"voter_records_response":{"registration_rejection":{"error":"no-match"}}}'
  end
end
