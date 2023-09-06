# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

platform :ios, '13.0' #this is pods project file deployment target which should be always main project's deployment target
post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0' #Installed SDKs(under pods)'s deployment target which should be always main project's deployment target
      end
    end
end

target 'Car-Book' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Car-Book
 pod 'IQKeyboardManagerSwift'
  pod 'Alamofire'
  pod 'SVProgressHUD'
  pod 'ObjectMapper'
  pod 'GooglePlaces' #'= 3.0.3'
  pod 'GooglePlacePicker' # '= 3.0.3'
  pod 'Kingfisher' #'~> 7.6'
  pod 'GoogleMaps'
  pod 'RangeSeekSlider'
  pod 'ImageSlideshow'
  target 'Car-BookTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Car-BookUITests' do
    # Pods for testing
  end

end
