Pod::Spec.new do |spec|
  spec.name         = 'IKCoreUI'
  spec.version      = '1.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/iankeen82/'
  spec.authors      = { 'Ian Keen' => 'iankeen82@gmail.com' }
  spec.summary      = 'Small UI related utilities mostly used as dependencies in other projects.'
  spec.source       = { :git => 'https://github.com/iankeen82/ikcoreui.git', :tag => spec.version.to_s }

  spec.source_files = 'IKCoreUI/**/**.{h,m}'
  
  spec.requires_arc = true
  spec.platform     = :ios
  spec.ios.deployment_target = "7.0"
end
