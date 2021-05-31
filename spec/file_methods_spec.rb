# frozen_string_literal: true

require 'simple_utilities/exceptions/file_methods_exception'
require 'simple_utilities/file_methods'
describe FileMethods do
  let(:src_file) { 'tmp/test.txt' }
  let(:dst_file) { 'tmp/test2.txt' }
  let(:dst_rb_file) { 'tmp/test2.rb' }
  before do
    FileUtils.rm_rf('tmp')
    FileUtils.mkdir 'tmp' unless File.exist?('tmp')
  end

  describe '#read:' do
    it 'file does not exists' do
      expect { FileMethods.read(src_file) }.to raise_error.with_message(/No file exists/)
    end

    it 'file exists' do
      File.open(src_file, 'w+') do |f|
        f.write('Hello Test')
      end
      expect(FileMethods.read(src_file)).to eq('Hello Test')
    end
  end

  describe '#merge_files:' do
    it 'different format files' do
      File.open(src_file, 'w+') do |f|
        f.write('Hello Test')
      end
      File.open(dst_rb_file, 'w+') do |f|
        f.write('class Hello; end')
      end
      expect { FileMethods.merge_files(src_file, dst_rb_file) }.to output(/Error Message/).to_stdout
    end

    it 'same format files' do
      File.open(src_file, 'w+') do |f|
        f.write('End of test')
      end
      File.open(dst_file, 'w+') do |f|
        f.write('Hello Test')
      end
      FileMethods.merge_files(src_file, dst_file)
      expect(FileMethods.read(dst_file)).to eq("Hello Test\nEnd of test")
    end
  end
end
