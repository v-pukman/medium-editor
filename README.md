# MediumEditor

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/medium/editor/engine`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'medium-editor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install medium-editor


## Configuration

Include javascript file in **app/assets/javascripts/application.js**:

```javascript
//= require medium-editor
```

Include stylesheet file in **app/assets/stylesheets/application.css**:

```css
/*
*= require medium-editor
*= require medium-editor/themes/flat.min
*/
```

## Using Medium Editor

Initialize Medium Editor

```html
<div class="editable"></div>

<script>
  $(document).ready(function(){
    var editor = new MediumEditor('.editable', {});
  });
</script>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/medium-editor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

