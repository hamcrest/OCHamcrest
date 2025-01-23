Pod::Spec.new do |s|
  s.name        = 'OCHamcrest'
  s.version     = '9.0.3'
  s.summary     = 'Hamcrest for Objective-C: Powerful, combinable, extensible matchers for verification.'
  s.description = <<-DESC
                      OCHamcrest is:
      
                      * a library of "matcher" objects for declaring rules to check whether a
                        given object matches those rules.
                      * a framework for writing your own matchers.
      
                      Matchers are useful for a variety of purposes, such as UI validation. But
                      they're most commonly used for writing unit tests that are expressive and
                      flexible.

                      OCHamcrest is compatible with:
      
                      * XCTest
                      * OCUnit (SenTestingKit)
                      * Kiwi
                      * Cedar
                      * GHUnit
                      * Google Toolbox for Mac (GTM)
                      * OCMock
                      * OCMockito
                  DESC
  s.homepage    = 'https://github.com/hamcrest/OCHamcrest'
  s.license     = { :type => 'BSD' }
  s.author      = { 'Jon Reid' => 'jon@qualitycoding.org' }
  s.social_media_url = 'https://iosdev.space/home'

  s.osx.deployment_target = '11.0'
  s.ios.deployment_target = '12.0'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '4.0'
  s.visionos.deployment_target = '1.0'
  s.source = { :git => 'https://github.com/hamcrest/OCHamcrest.git', :tag => 'v9.0.3' }
  s.source_files = 'Sources/OCHamcrest/OCHamcrest.h', 'Sources/OCHamcrest/Core/**/*.{h,m}', 'Sources/OCHamcrest/Library/**/*.{h,m}'
  s.private_header_files = 'Sources/OCHamcrest/Core/Helpers/HCRunloopRunner.h', 'Sources/OCHamcrest/Core/Helpers/NSInvocation+OCHamcrest.h', 'Sources/OCHamcrest/Core/Helpers/ReturnValueGetters/*.h', 'Sources/OCHamcrest/Core/Helpers/TestFailureReporters/HCGenericTestFailureReporter.h', 'Sources/OCHamcrest/Core/Helpers/TestFailureReporters/HCSenTestFailureReporter.h', 'Sources/OCHamcrest/Core/Helpers/TestFailureReporters/HCXCTestFailureReporter.h'
  s.requires_arc = true
end
