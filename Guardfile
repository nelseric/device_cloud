# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, cmd: 'rspec'  do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/device_cloud/(.+)\.rb$}) { |m| "spec/device_cloud/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
end



guard :bundler do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end


