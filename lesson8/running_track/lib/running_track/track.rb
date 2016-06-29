require 'workflow'

module RunningTrack
  class Track

    include Workflow

    attr_reader :track

    def initialize track
      @track = track
    end

    def to_s
      @track['Cells']['ObjectShortName']
    end

    workflow do
      state :unknown do
        event :rate_good, transitions_to: :good
        event :rate_normal, transitions_to: :normal
        event :rate_bad, transitions_to: :bad
      end
      state :good
      state :normal
      state :bad
    end
  end
end
