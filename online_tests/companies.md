## N
- What are strong parameters?
- What is a scope (model lamda)?
- What would be the foreign key relationship in a blog with comments?
- What is an accomplishment you are proud of in programming?
- Tell me about yourself

Talked about Bottega and Chapinka

## N second interview
- What is your favorite class and why in Ruby?
- Given this array ```['sam', 'evan', 'nelson']```, extract evan into cool_person
  - I used arr = (above array), then did ```cool_person = arr[arr.index_of['evan']]```
  - Evan: "I would use the select method to get that information"
- Was also asked to introduce myself
- They used J builder to get information to the view pages, no HTML
- I had to refactor his code to mimic a previous controller, had to do a model (which had a custom method), migration, controller, and index view which had
- (used guid as a primary key, also put ```index: true``` in the migration for the files that needed to be relational)

```Ruby
# Model
class NotificationTrigger < ApplicationRecord
  def self.find_greater_than_hour hours
    where("blackout_start_hours > #{hours}")
  end
end

# Controller
class NotificationTriggersController
  def index
    @greater_than_4 = NotificationTrigger.find_greater_than_hour(fetch_params)
  end

  def fetch_params
    params.permit(:blackout_start_hours)
  end
end

# Migration
```
