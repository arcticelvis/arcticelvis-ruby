# ArcticElvis

ArcticElvis is a fisherman from a long line of fishermen in the upmost arctic parts of Norway. He can help you get more fish - aka sell more. This is a ruby client for `api.arcticelvis.com`.

The API is documentet here: [http://docs.arcticelvis.apiary.io/](http://docs.arcticelvis.apiary.io/) (work in progress)

## Installation

Add this line to your application's Gemfile:

    gem 'arcticelvis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arcticelvis

## Usage

### Configuration

Setup the API key. It can be found under the settings meny in the app.

```
Arcticelvis.configure do |config|
  config.api_key = 'YOUR_API_KEY'
end
```

### Events
Events let you trigger event emails.

#### Trigger

```
event = Arcticelvis::Event.new(id: YOUR_EVENT_ID)

event.trigger({
	to: 'email@example.com',
	payload: {
		name: "Bob roy",
		personal_greeting: "Thanks for the signup Bob!",
		favorite_colors: ['red', 'blue']
	}
})

```

#### Find
Will lookup an event and all its messages

```
event = Arcticelvis::Event.find("EVENT_ID")
event.name #=> "New Signup"
event_message = event.event_messages[0]
event_message.state #=> "paused"

```


#### Preview event messages
TODO: make something like letter opener

```

event_message = Arcticelvis::EventMessage.new(id: EVENT_MESSAGE_ID, event_id: EVENT_ID)
event_message.preview({
	payload: {
		name: "ArcticElvis",
		age: 98
	}
})

	#simplified preview output =>
		"<html>…Thanks for the signup ArcticElvis, you are 98 years old. Really!?…</html>

```

you can also lookup an event and loop through its messages

```
event = Arcticelvis::Event.find("EVENT_ID")
event_message = event.event_messages[0]
event_message.preview({
	payload: {
		name: "ArcticElvis",
		age: 98
	}
})
```





## Contributing

1. Fork it ( http://github.com/<my-github-username>/arctic_elvis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
