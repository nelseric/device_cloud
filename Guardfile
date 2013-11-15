# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, cmd: 'rspec'  do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
end



guard :bundler do
  watch('Gemfile')
  # Uncomment next line if your Gemfile contains the `gemspec' command.
  watch(/^.+\.gemspec/)
end


