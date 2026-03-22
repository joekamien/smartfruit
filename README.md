# SmartFruit

A web app and API for browsing fruit data.

## Overview

### Usage

Once launched, go to `http://localhost:3000/` and the web UI will show you fruit data.

You should be able to filter the fruit by either web interface or querystring to show only fruit of a certain color, AND OR whether the fruit is in season or not.

You can also get raw JSON by going to `http://localhost:3000/fruit`, filtering with the same querystring.

#### Examples

**Filtering by Color / in Season / Name:**

```
Example 1: /fruit?color=red
Example 2: /fruit?in_season=true
Example 3: /fruit?color=red&in_season=true
Example 4: /fruit?name=app
```

### How to Build and Run

1. Clone from Github.

```bash
git clone https://github.com/joekamien/smartfruit.git
cd smartfruit
```

2. Install dependencies
```bash
bundle install
```

3. Install and start PostgreSQL

You will need PostgreSQL running locally.

Mac (Homebrew)
```bash
brew install postgresql
brew services start postgresql
```

Ubuntu / WSL
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev
sudo service postgresql start
```

4. Create and update database user

By default, Rails will try to connect using your system username.

If that's not what you want, create a user:

```bash
sudo -u postgres createuser -s $USER
```

Then edit `config/database.yml`, replacing "unixuser" with your username.

5. Setup the database

```bash
bin/rails db:prepare
```

Your first time, you should "seed" the database with data by running the following.
But this is optional. If you want to start with an empty database and add your own data manually, then skip this step.
```bash
bin/rails db:seed
```

6. Start the server

```bash
bin/dev
```

Then visit:

http://localhost:3000

