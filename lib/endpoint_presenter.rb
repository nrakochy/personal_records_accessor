class EndpointPresenter
  def format_http_response(data_records)
    { status: "success",
      data:
      { records: data_records }
    }.to_json
  end
end
