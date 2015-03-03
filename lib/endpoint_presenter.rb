class EndpointPresenter
  def format_http_response(data_records)
    { status: "success",
      data: {
      personal_records: data_records
    }
    }
  end
end
