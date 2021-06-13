require 'rails_helper'

RSpec.describe "PoST /booking", type: :request do

    before(:all) do
        @req_type_1 = {
            "start_date": "2021-03-12",
            "end_date": "2021-03-16",
            "nights": 4,
            "guests": 4,
            "adults": 2,
            "children": 2,
            "infants": 0,
            "status": "accepted",
            "guest": {
                "id": 1,
                "first_name": "Wayne",
                "last_name": "Woodbridge",
                "phone": "639123456789",
                "email": "wayne_woodbridge@bnb.com"
            },
            "currency": "AUD",
            "payout_price": "3800.00",
            "security_price": "500",
            "total_price": "4500.00"
        }
        @req_type_2 = {
            "reservation": {
                "start_date": "2021-03-12",
                "end_date": "2021-03-16",
                "expected_payout_amount": "3800.00",
                "guest_details": {
                    "localized_description": "4 guests",
                    "number_of_adults": 2,
                    "number_of_children": 2,
                    "number_of_infants": 0
                },
                "guest_email": "wayne_woodbridge@bnb.com",
                "guest_first_name": "Wayne",
                "guest_id": 1,
                "guest_last_name": "Woodbridge",
                "guest_phone_numbers": [
                    "639123456789",
                    "639123456789"
                ],
                "listing_security_price_accurate": "500.00",
                "host_currency": "AUD",
                "nights": 4,
                "number_of_guests": 4,
                "status_type": "accepted",
                "total_paid_amount_accurate": "4500.00"
            }
        }
    end

    describe "with empty params" do
        it "should return 200 & invalid error" do
            post "/api/booking", params: {}
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(json).to eq({errors: "Invalid params"})
        end
    end

    describe "Create with req type 1" do
        it "should return 200" do
            post "/api/booking", params: @req_type_1
            expect(response.status).to eq(200)
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(json).to eq({status: "ok"})
        end
    end

    describe "Create with req type 2" do
        it "should return 200" do
            post "/api/booking", params: @req_type_2
            expect(response.status).to eq(200)
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(json).to eq({status: "ok"})
        end
    end

end
