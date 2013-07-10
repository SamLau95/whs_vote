# WHS Vote

This is WHS Vote, an app developed for Whitney High School to use for school-wide voting events with the goal of providing a mobile-based outlet to increase student participation in WHS elections. Written using Rails version 3.2.1 and Ruby version 1.9.3

If you want to set up the app on your local machine, you may clone the repo using
```git clone https://github.com/SamLau95/whs_vote.git```

Then set up the app using
```
bundle install
bundle exec rake db:migrate
bundle exec rake db:populate
```
You may then start the server by running

```rails server```

To run the test suite:
```
bundle exec db:test:prepare
bundle exec rspec
```

Candidate categories are implemented in the Category class. To add your own categories inherit from Category and override the ```self.categories_for``` method.


Questions/Comments? Send me an email at samlau95@gmail.com