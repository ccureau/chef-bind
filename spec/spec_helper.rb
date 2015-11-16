require 'chefspec'
require 'chefspec/berkshelf'

# Creates a test coverage report at the end of the rspec run.
ChefSpec::Coverage.start!

TOPDIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$: << File.expand_path(File.dirname(__FILE__))

