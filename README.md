[![CircleCI](https://circleci.com/gh/jameswmoody/tab-out.svg?style=shield)](https://circleci.com/gh/jameswmoody/tab-out)
# TabOut
App to track and close your bar tab, without the risk of leaving your credit card at your favorite bar

## TabOut Development Team

| Members Names  | Github Handles |
| -------------- |:--------------:|
| James Moody | *jameswmoody* |
| Nico Glennon  | *nicoglennon* |
| Evan Hickle | *ehickle* |
| Josh Harvey | *jmharvey0* |


## Local Setup
1. Clone the Repo. Click [here](https://help.github.com/articles/cloning-a-repository/) if you need more information
2. Change to the directory
```
$ cd tab-out
```
3. Bundle install
```
$ bundle install
```
4. Create and migrate the database with rake commands
```
$ bundle exec rake db:create

$ bundle exec rake db:migrate
```
5. Run the Rails server
```
$ bundle exec rails server
```
6. Open [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) and go to localhost:3000 to view TabOut
7. Open up tabs for your favorite bar and fear not about leaving your credit card there!
