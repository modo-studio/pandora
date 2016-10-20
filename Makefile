.PHONY: default

spec:
	bundle exec rake
bootstrap:
	bundle install
default: 
	spec
