function add_labels(tag, timestamp, record)
  if record["container_name"] == nil and tag ~= nil then
    record["container_name"] = tag
  end
  local c = record["container_name"]
  if c ~= nil then
    local svc = string.match(c, "^([^-]+%-[^-]+)")
    if svc == nil then
      svc = string.match(c, "([^_]+)")
    end
    record["service"] = svc or "unknown"
  else
    record["service"] = "unknown"
  end
  return 1, timestamp, record
end