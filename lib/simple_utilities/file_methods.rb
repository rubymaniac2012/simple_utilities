# frozen_string_literal: true

# Test
module SimpleUtilities
  # Test
  class FileMethods
    def self.read(src_file)
      # Raise error if no file exists.
      # No rescue, because to test rspec when errors are raised
      raise NoFileExistsError, src_file unless File.file?(src_file)

      File.read(src_file)
    end

    def self.merge_files(src_file, dst_file)
      raise NoFileExistsError, src_file unless File.file?(src_file)
      raise NoFileExistsError, dst_file unless File.file?(dst_file)
      raise FormatNotMatchError unless File.extname(src_file) == File.extname(dst_file)

      src_data = FileMethods.read(src_file)
      File.write(dst_file, "\n#{src_data}", mode: 'a')
    rescue StandardError => e
      puts "Error Message: #{e.message}"
    end
  end
end

FileMethods = SimpleUtilities::FileMethods
