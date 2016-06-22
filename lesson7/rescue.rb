require 'benchmark'

Benchmark.bm(20) do |bm|
  bm.report 'классический вариант' do
    500_000.times do
      begin
        1 / 0
      rescue
      end
    end
  end
  # => 0.900714

  bm.report 'короткий вариант' do
    500_000.times { 1 / 0 rescue nil  }
  end
  # => 0.885297
end
