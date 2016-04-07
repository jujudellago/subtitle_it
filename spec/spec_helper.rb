#require 'colorize'
require 'rspec'
require 'rspec/mocks'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'subtitle_it'
include SubtitleIt

module SubFixtures
  def sub_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/pulpfiction.sub'))
  end

  def srt_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/godfather.srt'))
  end
  # has an empty string in 5th subtitle
  def bugged_srt_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/godfather_bugged.srt'))
  end
  
  def bugged_empty_lines
      File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/bug_empty_lines.srt'))
  end
  def problems_timestamps
     File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/problems_timestamps.srt'))
  end
  def problems_lines
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/problems_lines.srt'))
  end
  def wtf_srt
     File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/wtf.srt'))
  end

  def yml_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/sincity.yml'))
  end

  def rsb_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/pseudo.rsb'))
  end

  def xml_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/movie.xml'))
  end

  def mpl_fixture
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/puplfiction.mpl'))
  end
end

# ##
# rSpec Hash additions.
#
# From
#   * http://wincent.com/knowledge-base/Fixtures_considered_harmful%3F
#   * Neil Rahilly
class Hash
  ##
  # Filter keys out of a Hash.
  #
  #   { :a => 1, :b => 2, :c => 3 }.except(:a)
  #   => { :b => 2, :c => 3 }
  def except(*keys)
    reject { |k, _v| keys.include?(k || k.to_sym) }
  end
  ##
  # Override some keys.
  #
  #   { :a => 1, :b => 2, :c => 3 }.with(:a => 4)
  #   => { :a => 4, :b => 2, :c => 3 }
  def with(overrides = {})
    merge overrides
  end
  ##
  # Returns a Hash with only the pairs identified by +keys+.
  #
  #   { :a => 1, :b => 2, :c => 3 }.only(:a)
  #   => { :a => 1 }
  def only(*keys)
    reject { |k, _v| !keys.include?(k || k.to_sym) }
  end
end
