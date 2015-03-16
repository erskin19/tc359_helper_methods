guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')        { 'spec' }

  watch(%r{^(\w+)\.rb$})              { 'spec' }

  watch(%r{^helpers/(.+)\.rb$})       { |m| Dir["spec/helpers/#{m[1]}/*_spec.rb"] }
end
