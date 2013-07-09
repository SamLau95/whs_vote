# Stop lazy loading in development
if Rails.env.development?
  %w[student candidate category asb_category grade_category].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end