require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV["CODESPACES"]
    driven_by :selenium, using: :headless_firefox
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400] 
  end
end
