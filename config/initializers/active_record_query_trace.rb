if Rails.env.development?
  ActiveRecordQueryTrace.enabled = true
  ActiveRecordQueryTrace.level = :appbund
  # Optional: other gem config options go here
end
