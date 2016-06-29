require 'open-uri'
require 'timeout'
require 'json'

module RunningTrack
  module Data

    DATA_URL = "http://api.data.mos.ru/v1/datasets/899/rows"
    TIMEOUT = 1

    def self.import
      Timeout::timeout(TIMEOUT) do
        # sleep 2
        # p "[Table]: import data"
        data = parse(open DATA_URL)
        raise EmptyResponseError unless data.any?
        data
      end

    rescue Timeout::Error
      puts 'В настоящее время сервер не доступен. Попробуйте обратиться завтра.'
      exit
    rescue EmptyResponseError => e
      puts e.message
      exit
    end

    def self.parse response
      JSON.parse(response.read)
    end

    class EmptyResponseError < RuntimeError
      def message
        'Сервер ответил как-то неправильно :('
      end
    end

  end
end
