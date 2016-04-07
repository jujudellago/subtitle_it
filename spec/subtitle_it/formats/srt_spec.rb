require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Formats, '.srt' do
  include SubFixtures
  describe 'In' do
    before(:each) do
      @srt = Subtitle.new(dump: srt_fixture, format: 'srt')
    end
  
    it 'should parse the sub to an array' do
      expect(@srt.lines).to be_instance_of(Array)
    end
  
    #it 'should have N lines' do
    #  expect(@srt.lines.length).to eq(543)
    #end
  
    it 'should parse time of' do
      expect(@srt.lines[0].time_on.to_s).to eql('00:01:43.680')
    end
  
    it 'should parse time of' do
      expect(@srt.lines[0].time_off.to_s).to eql('00:01:45.557')
    end
  
   # it 'should parse text' do
   #   expect(@srt.lines[0].text).to eql('My dear children,')
   # end
  end
#  describe "Bugged srt management" do
#    before(:each) do
#      @srt = Subtitle.new(dump: bugged_srt_fixture, format: 'srt')
#      @raw_content=bugged_srt_fixture.read.split("\n")
#     
#    end
#   it 'should parse the sub to an array' do
#     expect(@srt.lines).to be_instance_of(Array)
#   end
#   it 'should have N lines' do
#      expect(@srt.lines.length).to eq(40)
#    end
#   it 'should replace empty lines with spaces' do
#     expect(@srt.lines[5].text).to eq("   ")
#   end
#   it 'should have the right amount of lines in raw content' do
#     expect(@raw_content.size).to eq(181)
#   end
# 
#    
#  end
  describe 'bugged empty lines' do
     before(:each) do
       @empty_lines=Subtitle.new(dump: bugged_empty_lines, format: 'srt')
      # @raw_content=bugged_empty_lines.read.split("\n")
      end
      it 'should parse the file with empty lines' do
         expect(@empty_lines.lines).to be_instance_of(Array)
       end
       it 'should fix problem with empty lines at the end of a file' do
          expect(@empty_lines.lines.length).to eq(1202)
       end
  end
  
  describe "bugged multiple empty lines at bottom of file" do
      before(:each) do
         @problems_timestamps=Subtitle.new(dump: problems_timestamps, format: 'srt')
        # @raw_content=bugged_empty_lines.read.split("\n")
      end
      it 'should parse the file with multiple empty lines' do
         expect(@problems_timestamps.lines).to be_instance_of(Array)
      end
  end
  
 describe "bugged lines" do
     before(:each) do
        @problems_lines=Subtitle.new(dump: problems_lines, format: 'srt')
       # @raw_content=bugged_empty_lines.read.split("\n")
     end
     it 'should parse the file with multiple empty lines' do
        expect(@problems_lines.lines).to be_instance_of(Array)
     end
 end
 describe "wtf srt " do
     before(:each) do
        @wtf_srt=Subtitle.new(dump: wtf_srt, format: 'srt')
       # @raw_content=bugged_empty_lines.read.split("\n")
     end
     it 'should parse the wtf file' do
        expect(@wtf_srt.lines).to be_instance_of(Array)
     end
 end
  
  
  
  
  describe 'Out!' do
    before(:each) do
      @sub = Subtitle.new(dump: yml_fixture, format: 'yml')
    end

    it 'should dump the object as a SRT' do
      expect(@sub.to_srt).to eql("1
00:05:26,500 --> 00:05:28,500
worth killing for...

2
00:06:00,400 --> 00:06:03,400
worth dying for...

3
00:07:00,300 --> 00:07:03,300
worth going to the hell for...

4
00:07:00,300 --> 00:07:03,300
worth going a \n line...\n")
    end
  end
end
