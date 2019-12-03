source 'https://github.com/CocoaPods/Specs.git'
workspace 'iAgreeDemo'
platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!

def shared_pods
    pod 'ReduxVM', :git => 'https://github.com/kocherovets/ReduxVM.git', :branch => 'master'
end

target "iAgreeDemo" do
    project 'iAgreeDemo'

    pod "iAgreeiOS"

    shared_pods
end

target "iAgreeDemoTests" do
    project 'iAgreeDemo'

    shared_pods
end

target "iAgreeDemoUITests" do
    project 'iAgreeDemo'

    shared_pods
end
