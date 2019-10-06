
  Pod::Spec.new do |s|
    s.name = 'CapacitorSoundEffect'
    s.version = '0.0.1'
    s.summary = 'Native sound effects'
    s.license = 'MIT'
    s.homepage = 'https://github.com/veloce/capacitor-sound-effect'
    s.author = 'Vincent Velociter'
    s.source = { :git => 'https://github.com/veloce/capacitor-sound-effect', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end