Pod::Spec.new do |s|
  s.name         = "STCKit"
  s.version      = "0.0.1"
  s.summary      = "Common UI component"
  s.homepage     = "https://cp.speechpro.com/home"
  s.license      = "MIT"
  s.author             = { "alexandrasoloshcheva" => "soloshcheva@speechpro.com" }
  s.platform     = :ios, "9.0"
  s.source   = { :git => 'https://github.com/STC-VoiceKey/stckit-ios.git', :tag => s.version, :submodules => true }
  s.requires_arc = true
  s.source_files = 'STCKit/**/*.{swift,m,c}'    
  s.public_header_files = 'STCKit/*.h'
end
