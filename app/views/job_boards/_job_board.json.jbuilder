json.extract! job_board, :id, :level, :created_at, :updated_at
json.url job_board_url(job_board, format: :json)