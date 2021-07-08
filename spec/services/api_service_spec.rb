# mock_data = '[{"name":"Hannukah"},
# {"name":"Dragon Boat Festival"},
# {"name":"Kwanza"}]'
# allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(double("response", status: 200, body: mock_data))
