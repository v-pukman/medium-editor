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

## Using Medium Editor plugins

Add all needed plugins to Gemfile

```ruby
gem 'medium-editor-tables-plugin'
gem 'medium-editor-insert-plugin'
gem 'medium-editor-buttons-plugin'
gem 'medium-editor-markdown-plugin'
```

Install plugins

```bash
rake medium_editor:install_plugins
```

This task will include all plugins assets in one file.
Then add this file to **app/assets/stylesheets/application.js**:

```javascript
//= require medium-editor-plugins
```
And **app/assets/stylesheets/application.css**:

```css
/*
*= require medium-editor-plugins
*/
```

Configure editor plugins. For example:

```javascript
$(document).ready(function(){
  var markdown = $(".markdown pre");

  var editor = new MediumEditor('.editable', {
    toolbar: {
      buttons: [
        'bold',
        'italic',
        'table',
        'b',
        'h2',
        'warning',
        'pop'
      ]
    },
    extensions: {
      table: new MediumEditorTable(),

      // compact
        'b':  new MediumButton({label:'BOLD', start:'<b>', end:'</b>'}),
        'h2': new MediumButton({label:'h2', start:'<h2>', end:'</h2>'}),

       // expanded
       'warning': new MediumButton({
          label: '<i class="fa fa-exclamation-triangle"></i>',
          start: '<div class="warning">',
          end:   '</div>'
       }),

      // with JavaScript
       'pop': new MediumButton({
          label:'POP',
          action: function(html, mark, parent){
                    alert('hello :)')
                    return html
                  }
        }),

      markdown: new MeMarkdown(function (md) {
        markdown.html(md);
      })
    }

  });

  $('.editable').mediumInsert({
    editor: editor,
    addons: {
      images: {
        fileUploadOptions: {
          url: '/medium-editor-insert-plugin/images/upload',
          acceptFileTypes: /(.|\/)(gif|jpe?g|png)$/i
        },

        fileDeleteOptions: {
          url: '/medium-editor-insert-plugin/images/delete',
        }
      }
    }
  });
})
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/medium-editor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

