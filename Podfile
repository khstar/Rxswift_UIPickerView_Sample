# Uncomment the next line to define a global platform for your project
# platform :ios, '10.0'

target 'Rxswift_UIPickerView_Sample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxCocoa'
  pod 'RxSwift'
  pod 'RxGesture'
  pod 'PureLayout'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end
