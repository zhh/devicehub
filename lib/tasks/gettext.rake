desc "Update pot/po files."
task :updatepo do
  require 'gettext/utils'
  GetText.update_pofiles("devicehub", Dir.glob("{app,lib,bin}/**/*.{rb,rhtml}"), "devicehub 1.0.0")
end

desc "Create mo-files"
task :makemo do
  require 'gettext/utils'
  GetText.create_mofiles(true, "po", "locale")
end
