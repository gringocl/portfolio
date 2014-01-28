guard :minitest, spring: 'rake test', test_folders: ['tests/features'], all_on_start: false do
  # with Minitest::Spec
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
  # Rails 4
  watch(%r{^app/(.+)\.rb$})                               { |m| "test/#{m[1]}_test.rb" }
  # watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
  # watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| "test/integration/#{m[1]}_test.rb" }
  # watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
  # watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  watch(%r{app/.*/[^.][^/]+\.(erb|haml|slim)})
  watch(%r{app/assets/(.*/[^.][^/]+\.css)(\.s[ac]ss)?}) { |m| "/assets/#{m[1]}" }
  watch(%r{app/assets/(.*/[^.][^/]+\.js)(\.coffee)?}) { |m| "/assets/#{m[1]}" }
  watch(%r{config/locales/[^.].+\.yml})
  # watch(%r{^app/controllers/(.*)\.rb$}) { |m| "test/functional/#{m[1]}_test.rb" }
end

guard 'ctags-bundler', :src_path => ["app", "lib", "spec/support"] do
    watch(/^(app|lib|spec\/support)\/.*\.rb$/)
      watch('Gemfile.lock')
end


