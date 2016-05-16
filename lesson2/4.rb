ar = %w(Ruby Python JavaScript Java .NET HTML Clojure Go)

p ar.inject({}) { |hash, lang| hash.merge lang.to_sym => lang.length }