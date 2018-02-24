Pod::Spec.new do |s|
  s.name             = 'SMInternDAO'
  s.version          = '0.1.5'
  s.summary          = 'Intern homework'

  s.description      = <<-DESC
Creating DAO for SQLite.swift and GRDB.swift
                       DESC

  s.homepage         = 'https://github.com/Matsepura/SMInternDAO'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { '<Matsepura>' => '<semen.matsepura@yandex.ru>' }
  s.source           = { :git => 'https://github.com/Matsepura/SMInternDAO.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'SMInternDAO/**/*.{h,swift,plist}'
  s.dependecy "GRDB.swift", "~> 2.8.0"

end
