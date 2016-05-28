def print_head(head)
  puts "\n"
  puts head.center(20, '-')
end


print_head 'Base64'
require 'base64'

# Методы модуля для кодирования/декодирования строки в base64
enc = Base64.encode64('i like ruby')
puts enc # => aSBsaWtlIHJ1Ynk=
puts Base64.decode64(enc) # => i like ruby


print_head 'Benchmark'
require 'benchmark'

# Метод модуля, принимающий блок и вычисляющий время его выполнения
puts Benchmark.realtime { 100_000.times { Base64.decode64(Base64.encode64 'i like ruby') } } # => 0.10543571200105362


print_head 'Find'
require 'find'

# Метод модуля для рекурсивного обхода дерева каталогов относительно имени заданного каталога
Find.find('./files') { |path| puts path } # => ./files
                                          # => ./files/file


print_head 'Digest::MD5'
require 'digest/md5'

# Метод класса, вычисляющий md5 хэш от строки
puts Digest::MD5.hexdigest('do md5 from me. now!') # => 45152ba30d036c624d31f82ae096f249


print_head 'Timeout'
require 'timeout'

# Метод модуля, выкидывающий исключение, если код исполняемый в блоке вычисляется более N секунд
begin
  Timeout.timeout(1) { 3.times { sleep 1 } }
rescue => e
  puts e.message # => execution expired
end