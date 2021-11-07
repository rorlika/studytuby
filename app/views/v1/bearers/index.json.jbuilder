json.array! @bearers do |bearer|
  json.partial! 'bearer', bearer: bearer
end
