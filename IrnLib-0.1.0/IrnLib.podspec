Pod::Spec.new do |s|
  s.name = "IrnLib"
  s.version = "0.1.0"
  s.summary = "A short description of IrnLib."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"liudongpu"=>"liudongpu@hotmail.com"}
  s.homepage = "https://github.com/uhutu/IrnLib"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :path => '.' }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/IrnLib.framework'
end
