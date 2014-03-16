desc 'Annotate models'
task :annotate => :environment do
  `bundle exec annotate --position before --exclude tests,fixtures`
  puts 'Models have been annotated.'
end
