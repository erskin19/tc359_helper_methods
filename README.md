# Helper Methods Practice

This is a simple app to help students practice writing helper methods. The front-end is done. The specs are written. It's now up to our server-side web developer to fill out the logic for the application in the first 3 helper methods of [our `MethodsPracticeHelper` module](https://github.com/chrisvfritz/tc359_helper_methods/blob/master/helpers/methods_practice_helpers.rb).

Just one file. Yet the very fate of our app depends on it. Are you up to the task?

## How to work on this

First, let's get this code on our own machine and create a new repo for our version of it.

``` bash
git clone https://github.com/chrisvfritz/tc359_helper_methods.git
cd tc359_helper_methods
git remote rm origin
hub create whatever_you_want_to_call_this_repo
```

Then we'll make sure the project's dependencies are installed.

``` bash
bundle install
```

And finally, we'll run guard, which is set up to watch our [methods_practice_helpers.rb](https://github.com/chrisvfritz/tc359_helper_methods/blob/master/helpers/methods_practice_helpers.rb) file and re-run our specs whenever we save a change.

```
bundle exec guard
```

When you start working on a method, remove the `, :pending` from the `describe` line with your method's name. For example, in `spec/helpers/methods_practice/image_tag_spec.rb`, we would change this line:

``` ruby
describe '#image_tag', :pending do
```

to:

``` ruby
describe '#image_tag' do
```

As we make progress, the specs should make their way from scary red to comforting green. When all our specs are green, that means everything should be working as it should. At the end, we can run our app with `bundle exec rackup` to confirm that everything on the front-end looks great.