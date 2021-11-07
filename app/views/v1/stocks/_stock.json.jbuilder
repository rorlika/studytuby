  json.id stock.id
  json.name stock.name
  json.archive stock.archive
  json.bearer do
    json.partial! 'v1/bearers/bearer', bearer: stock.bearer
  end
  json.created_at stock.created_at