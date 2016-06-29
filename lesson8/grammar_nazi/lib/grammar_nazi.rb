require 'json'
require_relative 'grammar_nazi/http_client'

class GrammarNazi

  URL = 'http://speller.yandex.net/services/spellservice.json/checkText'

  attr_reader :errors

  def initialize client: HTTPClient.new, lang: "#{:ru}, #{:en}"
    @client = client
    @lang = lang
    @errors = []
  end

  def check text
    @text = text
    @errors.clear
    @errors = JSON.parse @client.get(URL, { text: text, lang: @lang })
  end

  def result
    puts 'Текст:'
    puts @text
    puts 'Результат проверки:'

    if @errors.any?
      @errors.each { |error| print_error error }
    else
      puts 'Ошибок не найдено.'
    end
  end

  private

  def print_error error
    locate = "(строка: #{error['row']}, позиция #{error['pos']})"

    if error['s'].any?
      puts "#{error['word']} -> #{error['s'].join(', ')} #{locate}"
    else
      puts "#{error['word']} -> ??? #{locate}"
    end
  end

end
