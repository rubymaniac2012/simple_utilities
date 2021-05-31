# frozen_string_literal: true

# Test
module SimpleUtilities
  # Test
  class FormatNotMatchError < StandardError
    def initialize
      message = 'Both files should be of same format to merge.'
      super(message)
    end
  end

  # Test
  class NoFileExistsError < StandardError
    def initialize(path)
      message = "No file exists for the given path: #{path}"
      super(message)
    end
  end
end
