require 'ansi'
require 'pathname'

root = Pathname.new(File.expand_path('../benchmark', __FILE__))

Dir.glob(File.expand_path('../benchmark/**/bench_*.rb', __FILE__)) do |file|
  name = Pathname.new(file).relative_path_from(root)

  puts ANSI.yellow(name)
  puts

  require(file)
end
