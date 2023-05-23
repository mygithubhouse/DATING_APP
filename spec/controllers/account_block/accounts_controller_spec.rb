# require 'rails_helper'

# # require 'spec_helper'
# describe AccountBlock::AccountsController, type: :request do
#     before do
#         @params = {
#             "data" => {
#                 "type" => "email_account", "attributes" =>{
#                     "full_name" => "Nareshs", "email" => "naresh@gmail.com", "password" => "password", "password_confirmation" => "password"
#                 }
#             }
#         }
#         @full_phone_number = "+918142490847"
#         @base_url = "/account_block/accounts"
#         @account = FactoryBot.create(:account)
#         @token = BuilderJsonWebToken::JsonWebToken.encode(@account.id)

#     end
#     it "creates user" do
#         params = {
#         	"data" => {
#                 "type" => "email_account", "attributes" =>{
#                     "full_name" => "Nareshsi", "email" => "nareshthakur0090@gmail.com", "password" => "password", "password_confirmation" => "password"
#                 }
#             }
#         }
#         post @base_url, params: params
#         expect(response).to have_http_status(201)
#     end

#     it "sends otp" do
#         params = { "data": { "attributes": { "full_phone_number": @full_phone_number } } }
#         post "#{@base_url}/send_otp", params: params, headers: {token: @token}
#         expect(response).to have_http_status(201)
#         expect(JSON.parse(response.body)['meta']).to eq({"message"=>"Otp sent Successfully"})
#     end

#     it "confirms otp" do
#         full_phone_number = '918142490847'
#         params = { "data": { "attributes": { "full_phone_number": @full_phone_number } } }
#         post "#{@base_url}/send_otp", params: params, headers: {token: @token}
#         pin = AccountBlock::SmsOtp.where(full_phone_number: full_phone_number).last.pin
#         post "#{@base_url}/sms_confirmation", headers: {token: @token}, params: {"full_phone_number": full_phone_number, "pin": pin}
#         expect(response).to have_http_status(200)
#         expect(JSON.parse(response.body)['meta']['message']).to eq("Phone Number Confirmed Successfully") 
#     end

#     it "raise error for invalid pin" do
#         full_phone_number = '918142490847'
#         params = { "data": { "attributes": { "full_phone_number": @full_phone_number } } }
#         post "#{@base_url}/send_otp", params: params, headers: {token: @token}
#         post "#{@base_url}/sms_confirmation", headers: {token: @token}, params: {"full_phone_number": full_phone_number, "pin": 11111}
#         expect(response).to have_http_status(422)
#         expect(JSON.parse(response.body)).to eq({"errors"=>[{"pin"=>"Invalid Pin for Phone Number"}]}) 
#     end


#     it "raise error for invalid token" do
#         full_phone_number = '918142490847'
#         params = { "data": { "attributes": { "full_phone_number": @full_phone_number } } }
#         post "#{@base_url}/send_otp", params: params, headers: {token: @token}
#         post "#{@base_url}/sms_confirmation", headers: {token: "edjbssopcsdn"}, params: {"full_phone_number": full_phone_number, "pin": 11111}
#         expect(response).to have_http_status(400)
#         expect(JSON.parse(response.body)).to eq({"errors"=>[{"token"=>"Invalid token"}]}) 
#     end


# # work for identify yourself gender age date of birth   myself api
#     it "submits user's information like age, username, date of birth" do
#         params = {
#                   "data": 
#                     {
#                       "attributes": {
#                         "full_name": "Naresh CC",
#                         "gender": "Men",
#                         "date_of_birth": "08-09-1997",
#                         "interest": "Women"
#                       }
#                     }
#                 }
#         post "#{@base_url}/myself", params: params, headers: {token: @token}
#         expect(response).to have_http_status(200)
#         expect(JSON.parse(response.body)['meta']).to eq({"message"=>"Details added successfully."})
#     end

# #it works for get the data from admin side for identify yourself
#     it "shows the identify yourself part" do
#         get "#{@base_url}/identify_yourself", headers: {token: @token}
#         expect(response).to have_http_status(200)
#     end

# #it work for set the data for user
   
#     it "sets data for user" do
#         params = {
#                   "data": 
#                     {
#                       "attributes": {
#                             "answers":[
#                                 {
#                                 "question_id": 1,
#                                 "correct_answer": ["option1", "option2", "option3"]
#                                 },
#                                 {
#                                     "question_id": 2,
#                                     "correct_answer": ["option1", "option2"]
#                                 }
#                             ]
#                       }
#                     }
#                 }
#         post "#{@base_url}/user_identification", params: params, headers: {token: @token}
#         expect(response).to have_http_status(200)
#     end


#     it "logins the user " do
#         params = {
#                   "data": 
#                     {
#                       "type": "email_account",
#                       "attributes": {
#                         "email": "nareshthakur10@gmail.com",
#                         "password": "password"
#                       }
#                     }
#                 }
#           post "/bx_block_login/logins", params: params, headers: {token: @token}
#           expect(response).to have_http_status(200)
#           expect(JSON.parse(response.body)['meta']['success']).to eq([{"message"=>"Login Sucessfully"}])
#     end

#     it "shows invalid or not activated account" do
#         params = {
#                   "data": 
#                     {
#                       "type": "email_account",
#                       "attributes": {
#                         "email": "nareshthakur@gmail.com",
#                         "password": "password"
#                       }
#                     }
#                 }
#           post "/bx_block_login/logins", params: params
#           expect(response).to have_http_status(422)
#           expect(JSON.parse(response.body)).to eq({"errors"=>[{"failed_login"=>"Account not found, or not activated"}]})
#     end
# end
