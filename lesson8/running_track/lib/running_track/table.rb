require 'active_support/core_ext/hash/slice'
require 'terminal-table'
require_relative 'track'

module RunningTrack
  class Table

    HEADINGS = ["District", "Address", "HelpPhone", "ObjectHasWifi"]

    def print
      @table ||= create_table
      puts @table
    end

    private

    def initialize data
      @rows = prepare(data)
    end

    def prepare data
      data.map! do |row|
        row['Cells'].slice(*HEADINGS).values
      end
    end

    def create_table
      # p "[Table]: create table"
      sep_rows = @rows.zip(Array.new(@rows.count - 1){ :separator }).flatten(1).compact
      Terminal::Table.new rows: sep_rows, headings: HEADINGS
    end

  end
end
