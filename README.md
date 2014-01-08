# ArcticElvis

ArcticElvis is a fisherman from a long line of fishermen in the upmost arctic parts of Norway. He can help you get more fish - aka sell more. This is a ruby client for `api.arcticelvis.com`.

The API is documentet here: [http://docs.arcticelvis.apiary.io/](http://docs.arcticelvis.apiary.io/) (work in progress)

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
Events let you trigger event emails.

#### Trigger

```
event = ArcticElvis::Event.find("EVENT_ID")

event.trigger({
	to: 'email@example.com',
	payload: {
		name: "Bob roy",
		personal_greeting: "Thanks for the signup Bob!",
		favorite_colors: ['red', 'blue']
	}
})

```

#### Preview event messages
TODO: make something like letter opener

```
event = ArcticElvis::Event.find("EVENT_ID")

event_message = event.event_messages[0]

event_message.preview({
	payload: {
		name: "ArcticElvis",
		age: 98
	}
})

	#=> simplified preview output
		{
		   "event_message" => {
           	    "id" => 714,
	            "subject" => "Welome!",
		        "created_at" => "2014-01-08T06:38:52Z",
         	    "updated_at" => "2014-01-08T06:38:52Z",
           	 	"state" => "paused",
	            "preview" => "<html>…Thanks for the signup ArcticElvis, you are 98 years old. Really!?…</html>"
		    }
		}


```



## Contributing

1. Fork it ( http://github.com/<my-github-username>/arctic_elvis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
