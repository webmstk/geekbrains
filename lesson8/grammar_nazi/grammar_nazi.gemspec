Gem::Specification.new do |s|
  s.name        = 'grammar_nazi'
  s.version     = '0.1.5'
  s.date        = '2016-06-25'
  s.summary     = 'Spell checker'
  s.description = 'ruby wrapper for speller.yandex.net'
  s.authors     = ['webmstk']
  s.email       = 'webmstk@mail.ru'
  s.files       = %w(
                      lib/grammar_nazi.rb
                      lib/grammar_nazi/http_client.rb
                      spec/grammar_nazi_spec.rb
                      spec/spec_helper.rb
                      .rspec
                      README.md
                    )
  s.homepage    = 'https://github.com/webmstk/grammar_nazi'
  s.license     = 'MIT'
end
