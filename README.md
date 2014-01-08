# ArcticElvis

ArcticElvis is a fisherman from a long line of fishermen from the upmost arctic parts of Norway. He can help you get more fish - aka sell more. This is a ruby client for `api.arcticelvis.com`.

## Installation

Add this line to your application's Gemfile:

    gem 'arctic_elvis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arctic_elvis

## Usage

### Configuration

Setup the API key. It can be found under the settings meny in the app.

```
ArcticElvis.configure do |config|
  config.api_key = 'YOUR_API_KEY'
end
```

### Events
Events let you trigger event emails. Learn more [link_to_todo]()

#### Trigger

```
event = ArcticElvis::Event.find("signup")

event.trigger({
	to: 'Mr Success <email@example.com>',
	bcc: 'bcc@example.com',	
	payload: {
		name: "Bob roy",
		personal_greeting: "Thanks for the signup Bob!",
		favorite_colors: ['red', 'blue']
	}
})

	#	response =>
	#	{
	#		status: "success",	
	#		event: {
	#			id: '123',
	#			handel: 'signup',
	#			triggered_last_30_days: 34	
	#		}
	#	
	#	}

```

Options:
	
	to: email
	bss: email
	force: boolean, defaults to false. If true it will send to unsubscribed

## Contributing

1. Fork it ( http://github.com/<my-github-username>/arctic_elvis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
