RSpec.configure do |config|
  config.before(:suite) do
    DatabaseRewinder.clean_with(
      :truncation,
      except:
        %w(),
    )
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end
end
