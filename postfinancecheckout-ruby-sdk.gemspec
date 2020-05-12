# -*- encoding: utf-8 -*-
#
=begin
PostFinance Checkout API: 2.2.0

The PostFinance Checkout API allows an easy interaction with the PostFinance Checkout web service.



Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

$:.push File.expand_path("../lib", __FILE__)
require "postfinancecheckout-ruby-sdk/version"

Gem::Specification.new do |s|
  s.name        = "postfinancecheckout-ruby-sdk"
  s.version     = PostFinanceCheckout::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["customweb GmbH"]
  s.email       = ["info@customweb.com"]
  s.homepage    = "https://checkout.postfinance.ch/"
  s.summary     = "A ruby wrapper around the PostFinance Checkout API."
  s.description = "The PostFinance Checkout SDK allows an easy interaction with the PostFinance Checkout web service."
  s.license     = "Apache-2.0"
  s.required_ruby_version = ">=2.2"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.3'

  
  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find test/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
