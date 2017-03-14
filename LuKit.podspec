Pod::Spec.new do |s|

  s.name         = "LuKit"
  s.version      = "0.1.0"
  s.summary      = "A custom framework."
  # s.description  = <<-DESC
  #                 A custom framework.
  #           * Think: What does it do? Why did you write it? What is the focus?
  #           * Try to keep it short, snappy and to the point.
  #           * Write the description between the DESC delimiters below.
  #           * Finally, don't worry about the indent, CocoaPods strips it!
  #                  DESC

  s.homepage     = "https://github.com/RamboLouis/LuKit"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "RamboLu" => "coderambolu@gmail.com" }

  # s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/RamboLouis/LuKit.git", :tag => s.version }

  s.source_files  = "Source/*.swift"

  s.requires_arc = true

  # s.dependency "JSONKit", "~> 1.4"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
