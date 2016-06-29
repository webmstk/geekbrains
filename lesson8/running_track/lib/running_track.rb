require 'pp'
require 'active_support/all'
require_relative 'running_track/data'
require_relative 'running_track/table'
require 'yaml'

module RunningTrack

  YAML_FILE = 'lesson8/running_track/lib/data/tracks.yml'

  @cache = {}

  # @cache = 101

  def self.print
    # Table.new(Data.import).print
    @cache[:table] ||= get_table
    @cache[:table].print
  end

  def self.get_cache
    @cache
  end

  def self.clear_cache
    @cache = {}
  end

  def self.find params
    tracks.select do |track|
      params.all? do |key, val|
        track.track['Cells'][key.to_s] == val
      end
    end
  end

  def self.random count = 1
    tracks.shuffle.take count
  end

  def self.save!
    data = tracks.map { |track| track.track }.to_yaml
    File.new(YAML_FILE, 'w').write(data)
  rescue
    raise 'Не записалось :('
  end

  def self.load!
    YAML.load(File.open YAML_FILE)
  rescue
    raise 'Не прочиталось :('
  end

  private

  def self.tracks
    @cache[:tracks] ||= get_tracks
  end

  def self.get_table
    Table.new Data.import
  end

  def self.get_tracks
    Data.import.map! { |track| Track.new track }
  end

end

# p RunningTrack.get_cache.keys
# RunningTrack.print
# RunningTrack.print
# p RunningTrack.get_cache.keys


# tracks = RunningTrack.find(ObjectHasWifi: 'да', ObjectHasCashMachine: 'да')
tracks = RunningTrack.random 1
track = tracks.first
p track.unknown? # => true
p track.good? # => false
track.rate_good!
p track.unknown? # => false
p track.good? # => true

# p RunningTrack.save!
# p RunningTrack.load!
