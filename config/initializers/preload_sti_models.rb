if Rails.env.development?
  %w[student candidate asb_candidate grade_candidate].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end