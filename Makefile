.PHONY: default

spec:
	bundle exec rake
bootstrap:
	bundle install
deploy:
	gem build pandora
	gem push pandora
default: 
	spec
