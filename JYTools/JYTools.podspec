Pod::Spec.new do |spec|
  	spec.name         = "JYTools"
  	spec.version      = "1.0.0"
  	spec.summary      = "本人封装的开发工具集合"

  	spec.homepage     = "https://github.com/JYYQLin/JYYQTools"

  	spec.license      = { :type => "MIT", :file => "LICENSE" }

  	spec.author       = { "JYYQLin" => "No mailBox" }

  	spec.source       = { :git => "https://github.com/JYYQLin/JYYQTools.git", :tag => spec.version }
  	spec.source_files  = "JYTools/Tools/**/*.{h,m,swift}"

	spec.swift_versions = ['5.0', '5.1', '5.2']

  	spec.ios.deployment_target = "13.0"

end

