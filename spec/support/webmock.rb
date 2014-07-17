# stop network connections
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_some_requests
  end
end

def stub_some_requests
  WebMock.stub_request(:get, /https:\/\/bikeindex.org\/api\/v1\/bikes\?.*/).
    to_return(status: 200, body: %q({"bikes":[]}), headers: {})

  WebMock.stub_request(:get, "https://bikeindex.org/api/v1/bikes/3414").
    to_return(status: 200, body: %q{{"bikes":{"id":3414,"serial":"stolen_serial_number","registration_created_at":"2014-05-20T10:34:44-05:00","registration_updated_at":"2014-06-25T14:39:59-05:00","url":"https://bikeindex.org/bikes/3414","api_url":"https://bikeindex.org/api/v1/bikes/3414","manufacturer_name":"Jamis","manufacturer_id":201,"frame_colors":["Blue"],"paint_description":null,"stolen":true,"name":"","year":2014,"frame_model":"Allegro Comp Disc","description":"Triple-butted 6061 aluminum with hydro-formed top and down tube, taper gauge \"S\" bend stays, replaceable derailleur hanger, disc brake mounts, eyeleted dropouts and seatstay rack mounts","rear_tire_narrow":true,"front_tire_narrow":true,"photo":"https://bikebook.s3.amazonaws.com/uploads/Fr/9979/14_allegrocompdisc_bk.jpg","thumb":"https://bikebook.s3.amazonaws.com/uploads/Fr/9979/small_14_allegrocompdisc_bk.jpg","title":"2014 Jamis Allegro Comp Disc (blue)","images":[],"rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2014-05-20T01:00:00-05:00","location":"Chicago, IL","latitude":41.9161202,"longitude":-87.6677594,"theft_description":"This is a test stolen bike.","locking_description":"U-lock","lock_defeat_description":"Lock is missing, along with the bike.","police_report_number":"Some number","police_report_department":"Chicago, IL","created_at":"2014-05-20T10:34:58-05:00"},"components":[{"component_type":"fork","component_group":"Frame and fork","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"headset","component_group":"Frame and fork","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"wheel","component_group":"Wheels","rear":null,"front":true,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"wheel","component_group":"Wheels","rear":true,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"tire","component_group":"Wheels","rear":null,"front":true,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"tire","component_group":"Wheels","rear":true,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"derailleur","component_group":"Drivetrain and brakes","rear":null,"front":true,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"derailleur","component_group":"Drivetrain and brakes","rear":true,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"shifter","component_group":"Drivetrain and brakes","rear":null,"front":true,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"shifter","component_group":"Drivetrain and brakes","rear":true,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"chain","component_group":"Drivetrain and brakes","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"cog/cassette/freewheel","component_group":"Drivetrain and brakes","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"crankset","component_group":"Drivetrain and brakes","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"bottom bracket","component_group":"Drivetrain and brakes","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"pedals","component_group":"Drivetrain and brakes","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"brake","component_group":"Drivetrain and brakes","rear":null,"front":true,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"brake","component_group":"Drivetrain and brakes","rear":true,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"handlebar","component_group":"Additional parts","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"stem","component_group":"Additional parts","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"grips/tape","component_group":"Additional parts","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"seatpost","component_group":"Additional parts","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null},{"component_type":"saddle","component_group":"Additional parts","rear":null,"front":null,"manufacturer_name":null,"manufacturer_id":null,"model_name":"","year":null}]}}
        }, headers: {})

  WebMock.stub_request(:get, "https://bikeindex.org/api/v1/bikes").
    with(query: {"serial" => "stolen_serial_number"}).
    to_return(status: 200, body: %q({"bikes":[{"id":3414,"serial":"stolen_serial_number","registration_created_at":"2014-05-20T10:34:44-05:00","registration_updated_at":"2014-06-25T14:39:59-05:00","url":"https://bikeindex.org/bikes/3414","api_url":"https://bikeindex.org/api/v1/bikes/3414","manufacturer_name":"Jamis","manufacturer_id":201,"frame_colors":["Blue"],"paint_description":null,"stolen":true,"name":"","year":2014,"frame_model":"Allegro Comp Disc","description":"Triple-butted 6061 aluminum with hydro-formed top and down tube, taper gauge \"S\" bend stays, replaceable derailleur hanger, disc brake mounts, eyeleted dropouts and seatstay rack mounts","rear_tire_narrow":true,"front_tire_narrow":true,"photo":"https://bikebook.s3.amazonaws.com/uploads/Fr/9979/14_allegrocompdisc_bk.jpg","thumb":"https://bikebook.s3.amazonaws.com/uploads/Fr/9979/small_14_allegrocompdisc_bk.jpg","title":"2014 Jamis Allegro Comp Disc (blue)","rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2014-05-20T01:00:00-05:00","location":"Chicago, IL","latitude":41.9161202,"longitude":-87.6677594,"theft_description":"This is a test stolen bike.","locking_description":"U-lock","lock_defeat_description":"Lock is missing, along with the bike.","police_report_number":"Some number","police_report_department":"Chicago, IL","created_at":"2014-05-20T10:34:58-05:00"}}]}), headers: {})

  WebMock.stub_request(:get, "https://bikeindex.org/api/v1/bikes").
    with(query: {"serial" => "EN14764"}).
    to_return(status: 200, body: %q({"bikes":[{"id":9981,"serial":"EN14764","registration_created_at":"2014-04-14T01:00:00-05:00","registration_updated_at":"2014-06-15T19:33:00-05:00","url":"https://bikeindex.org/bikes/9981","api_url":"https://bikeindex.org/api/v1/bikes/9981","manufacturer_name":"Specialized","manufacturer_id":307,"frame_colors":["Orange"],"paint_description":null,"stolen":true,"name":null,"year":2009,"frame_model":"Globe","description":"suspension front forkkryptonite u-lock still attached to front frame - I have proof of ownership - ","rear_tire_narrow":true,"front_tire_narrow":null,"photo":null,"thumb":null,"title":"2009 Specialized Globe (orange)","rear_wheel_size":null,"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2014-04-13T01:00:00-05:00","location":"Portland, OR, 97214","latitude":null,"longitude":null,"theft_description":"2524 SE Clinton StWorkshop Brew Pub Reward: Yes","locking_description":null,"lock_defeat_description":null,"police_report_number":"report filed, pending approval, tracking ID T14003623","police_report_department":"Portland PD","created_at":"2014-06-14T12:16:36-05:00"}},{"id":9930,"serial":"en14764","registration_created_at":"2014-02-03T00:00:00-06:00","registration_updated_at":"2014-06-15T19:32:58-05:00","url":"https://bikeindex.org/bikes/9930","api_url":"https://bikeindex.org/api/v1/bikes/9930","manufacturer_name":"Specialized","manufacturer_id":307,"frame_colors":["Black"],"paint_description":null,"stolen":true,"name":null,"year":2011,"frame_model":"Sirris","description":"","rear_tire_narrow":true,"front_tire_narrow":null,"photo":"https://bikeindex.s3.amazonaws.com/uploads/Pu/3863/large_1391447328.jpg","thumb":"https://bikeindex.s3.amazonaws.com/uploads/Pu/3863/small_1391447328.jpg","title":"2011 Specialized Sirris (black)","rear_wheel_size":null,"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2014-02-02T00:00:00-06:00","location":"Saint Paul, MN, 55114","latitude":null,"longitude":null,"theft_description":"parking garage","locking_description":null,"lock_defeat_description":null,"police_report_number":null,"police_report_department":null,"created_at":"2014-06-14T12:15:54-05:00"}},{"id":21095,"serial":"EN14764","registration_created_at":"2013-08-28T01:00:00-05:00","registration_updated_at":"2014-06-29T09:58:25-05:00","url":"https://bikeindex.org/bikes/21095","api_url":"https://bikeindex.org/api/v1/bikes/21095","manufacturer_name":"Specialized","manufacturer_id":307,"frame_colors":["Black"],"paint_description":null,"stolen":true,"name":null,"year":2013,"frame_model":"Sirrus","description":"Was eating lunch at U-Zen Sushi on Santa Monica blvd. and Brockton Ave.  I locked my bike up against the guard railing outside of the building.  I come back out 30 minutes later and the bike was missing.  Approx. 12:15 - 12:30 - I have proof of ownership -  Specialized A1 Premium Aluminum, fully manipulated butted tubing, integrated lower bearing, fender/rack eyelets","rear_tire_narrow":true,"front_tire_narrow":true,"photo":"https://bikeindex.s3.amazonaws.com/uploads/Pu/7423/large_1377731504.jpg","thumb":"https://bikeindex.s3.amazonaws.com/uploads/Pu/7423/small_1377731504.jpg","title":"2013 Specialized Sirrus (black)","rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2013-08-21T01:00:00-05:00","location":"West Los Angeles, CA, 90025","latitude":34.0448583,"longitude":-118.4484367,"theft_description":"building guard railing Reward: $250","locking_description":null,"lock_defeat_description":null,"police_report_number":"130813190","police_report_department":"LAPD West LA Station","created_at":"2014-06-14T15:52:17-05:00"}},{"id":19458,"serial":"EN14764","registration_created_at":"2013-06-16T01:00:00-05:00","registration_updated_at":"2014-06-15T20:08:36-05:00","url":"https://bikeindex.org/bikes/19458","api_url":"https://bikeindex.org/api/v1/bikes/19458","manufacturer_name":"Specialized","manufacturer_id":307,"frame_colors":["Blue"],"paint_description":"Black/Silver","stolen":true,"name":null,"year":2011,"frame_model":"Sirrus","description":"Blue Specialized Sirrus bike. Fell from rack on I96. When i returned to pick it up bike was gone. - I have proof of ownership -  Specialized A1 Premium aluminum, fully manipulated tubing, smooth weld compact design, internal cable routing , integrated headset,fender and rack eyelets","rear_tire_narrow":true,"front_tire_narrow":true,"photo":"https://bikebook.s3.amazonaws.com/uploads/Fr/4093/7902","thumb":"https://bikebook.s3.amazonaws.com/uploads/Fr/4093/small_7902","title":"2011 Specialized Sirrus (blue)","rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2013-06-15T01:00:00-05:00","location":"Howell, MI, 48844","latitude":null,"longitude":null,"theft_description":"I96 roadside Reward: $50","locking_description":null,"lock_defeat_description":null,"police_report_number":null,"police_report_department":null,"created_at":"2014-06-14T15:22:05-05:00"}},{"id":20700,"serial":"EN14764","registration_created_at":"2013-06-04T01:00:00-05:00","registration_updated_at":"2014-06-29T09:52:41-05:00","url":"https://bikeindex.org/bikes/20700","api_url":"https://bikeindex.org/api/v1/bikes/20700","manufacturer_name":"Specialized","manufacturer_id":307,"frame_colors":["Green","Black"],"paint_description":null,"stolen":true,"name":null,"year":2008,"frame_model":"Vita Sport Women\\\\'s","description":"extra small frame women's hybrid bike.  straight handlebars with hand breaks.  had a black bike rack attached to the back.","rear_tire_narrow":true,"front_tire_narrow":null,"photo":"https://bikeindex.s3.amazonaws.com/uploads/Pu/7284/large_1370404532.jpg","thumb":"https://bikeindex.s3.amazonaws.com/uploads/Pu/7284/small_1370404532.jpg","title":"2008 Specialized Vita Sport Women\\\\'s (green and black)","rear_wheel_size":null,"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2013-05-18T01:00:00-05:00","location":"Oakland, CA, 94618","latitude":null,"longitude":null,"theft_description":"Garage Reward: 150","locking_description":null,"lock_defeat_description":null,"police_report_number":"13-904719","police_report_department":"Oakland","created_at":"2014-06-14T15:42:16-05:00"}},{"id":26792,"serial":"EN14764","registration_created_at":"2012-03-27T01:00:00-05:00","registration_updated_at":"2014-06-15T20:27:23-05:00","url":"https://bikeindex.org/bikes/26792","api_url":"https://bikeindex.org/api/v1/bikes/26792","manufacturer_name":"Trek","manufacturer_id":47,"frame_colors":["Black"],"paint_description":"Matte Black","stolen":true,"name":null,"year":2010,"frame_model":"7.1 FX","description":"Black 7.1 FX Trek commuter bike - I have proof of ownership -  FX Alpha White Aluminum","rear_tire_narrow":false,"front_tire_narrow":false,"photo":"https://bikeindex.s3.amazonaws.com/uploads/Pu/9284/large_1332868936.jpg","thumb":"https://bikeindex.s3.amazonaws.com/uploads/Pu/9284/small_1332868936.jpg","title":"2010 Trek 7.1 FX (black)","rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2012-03-21T01:00:00-05:00","location":"Lansing, MI, 48933","latitude":null,"longitude":null,"theft_description":"Bike Rack in front of Romney Building Reward: 25","locking_description":null,"lock_defeat_description":null,"police_report_number":"LLA120321002997","police_report_department":"Lansing","created_at":"2014-06-14T17:42:44-05:00"}},{"id":24095,"serial":"EN14764","registration_created_at":"2011-11-25T00:00:00-06:00","registration_updated_at":"2014-06-15T20:21:11-05:00","url":"https://bikeindex.org/bikes/24095","api_url":"https://bikeindex.org/api/v1/bikes/24095","manufacturer_name":"Cannondale","manufacturer_id":62,"frame_colors":["Black"],"paint_description":null,"stolen":true,"name":null,"year":2009,"frame_model":"Quick","description":"Black, with dark green highlights. Has a front, handlebar mounted headlight, as well as a rear light on seat post. Has water cage on chassis and might still have locked u-lock around chassis. - I have proof of ownership - ","rear_tire_narrow":true,"front_tire_narrow":null,"photo":null,"thumb":null,"title":"2009 Cannondale Quick (black)","rear_wheel_size":null,"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":{"date_stolen":"2011-11-24T00:00:00-06:00","location":"Chicago, IL, 60657-","latitude":41.94256,"longitude":-87.680155,"theft_description":"Apartment","locking_description":null,"lock_defeat_description":null,"police_report_number":"HT604752","police_report_department":"Chicago police department","created_at":"2014-06-14T16:40:38-05:00"}},{"id":2297,"serial":"EN14764","registration_created_at":"2014-04-04T17:25:27-05:00","registration_updated_at":"2014-06-15T18:53:24-05:00","url":"https://bikeindex.org/bikes/2297","api_url":"https://bikeindex.org/api/v1/bikes/2297","manufacturer_name":"Specialized","manufacturer_id":307,"frame_colors":["Silver or Gray"],"paint_description":"Gloss Dark Graphite","stolen":false,"name":"","year":2012,"frame_model":"Sirrus","description":"Specialized A1 Premium Aluminum, fully manipulated butted tubing, integrated lower bearing, fender/rack eyelets","rear_tire_narrow":true,"front_tire_narrow":true,"photo":"https://bikeindex.s3.amazonaws.com/uploads/Pu/1782/large_IMG_4567.JPG","thumb":"https://bikeindex.s3.amazonaws.com/uploads/Pu/1782/small_IMG_4567.JPG","title":"2012 Specialized Sirrus (silver or gray)","rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"handlebar_type":{"name":"Flat","slug":"flat"},"frame_material":{"name":"Aluminum","slug":"aluminum"},"front_gear_type":{"name":"3"},"rear_gear_type":{"name":"8"},"stolen_record":null},{"id":986,"serial":"EN14764","registration_created_at":"2013-10-17T05:37:13-05:00","registration_updated_at":"2014-06-15T18:55:43-05:00","url":"https://bikeindex.org/bikes/986","api_url":"https://bikeindex.org/api/v1/bikes/986","manufacturer_name":"Jumbo Z\u00fcrich Modell Practic","manufacturer_id":100,"frame_colors":["Blue"],"paint_description":null,"stolen":false,"name":"","year":null,"frame_model":"","description":"","rear_tire_narrow":false,"front_tire_narrow":false,"photo":"https://bikeindex.s3.amazonaws.com/uploads/Pu/525/large_velo.jpg","thumb":"https://bikeindex.s3.amazonaws.com/uploads/Pu/525/small_velo.jpg","title":"Jumbo Z\u00fcrich Modell Practic (blue)","rear_wheel_size":{"iso_bsd":559,"name":"26in","description":"26in (Standard size)"},"front_wheel_size":{"iso_bsd":559,"name":"26in","description":"26in (Standard size)"},"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":null},{"id":28133,"serial":"en14764","registration_created_at":"2014-07-07T13:51:34-05:00","registration_updated_at":"2014-07-07T13:52:57-05:00","url":"https://bikeindex.org/bikes/28133","api_url":"https://bikeindex.org/api/v1/bikes/28133","manufacturer_name":"SCOTT","manufacturer_id":296,"frame_colors":["Black","Red"],"paint_description":null,"stolen":false,"name":"","year":null,"frame_model":"metrix 2.0","description":"","rear_tire_narrow":true,"front_tire_narrow":null,"photo":null,"thumb":null,"title":"SCOTT metrix 2.0 (black and red)","rear_wheel_size":null,"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":null},{"id":2322,"serial":"EN14764","registration_created_at":"2014-04-06T17:45:35-05:00","registration_updated_at":"2014-06-15T18:53:22-05:00","url":"https://bikeindex.org/bikes/2322","api_url":"https://bikeindex.org/api/v1/bikes/2322","manufacturer_name":"Felt","manufacturer_id":136,"frame_colors":["Black"],"paint_description":null,"stolen":false,"name":"","year":null,"frame_model":"Verza City Matte (Eclipse)","description":"","rear_tire_narrow":true,"front_tire_narrow":null,"photo":null,"thumb":null,"title":"Felt Verza City Matte (Eclipse) (black)","rear_wheel_size":null,"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":null},{"id":495,"serial":"En14764","registration_created_at":"2013-07-21T14:21:49-05:00","registration_updated_at":"2014-06-15T18:57:20-05:00","url":"https://bikeindex.org/bikes/495","api_url":"https://bikeindex.org/api/v1/bikes/495","manufacturer_name":"Globe","manufacturer_id":943,"frame_colors":["Red"],"paint_description":null,"stolen":false,"name":null,"year":null,"frame_model":null,"description":null,"rear_tire_narrow":true,"front_tire_narrow":null,"photo":null,"thumb":null,"title":"Globe (red)","rear_wheel_size":{"iso_bsd":622,"name":"700 C","description":"700 C, 29in mountain bikes (Standard size)"},"front_wheel_size":null,"handlebar_type":null,"frame_material":null,"front_gear_type":null,"rear_gear_type":null,"stolen_record":null}]}), headers: {})

end