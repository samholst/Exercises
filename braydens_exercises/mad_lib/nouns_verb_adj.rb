module GeneratorWords
  extend self

  @word_hash = {
    :nouns => [
              "people",
              "history",
              "way",
              "art",
              "world",
              "information",
              "map",
              "two",
              "family",
              "government",
              "health",
              "system",
              "computer",
              "meat",
              "year",
              "thanks",
              "music",
              "person",
              "reading",
              "method",
              "data",
              "food",
              "understanding",
              "theory",
              "law",
              "bird"
            ],
    :names => [
              "Noah",
              "Emma",
              "Liam",
              "Olivia",
              "William",
              "Ava",
              "Mason",
              "Sophia",
              "James",
              "Isabella",
              "Benjamin",
              "Mia",
              "Jacob",
              "Charlotte",
              "Michael",
              "Abigail",
              "Elijah",
              "Emily",
              "Ethan",
              "Harper"
            ],
    :adjectives => [
                  "agreeable",
                  "brave",
                  "calm",
                  "delightful",
                  "eager",
                  "faithful",
                  "gentle",
                  "happy"
                ],
    :numbers => [
                  1, 15, 222, 30, 4, 55, 61, 75, 8, 100, 45, 33, 1001
                ],
    :verbs => [
                "clean",
                "cut",
                "drive",
                "eat",
                "fly",
                "go",
                "live",
                "make",
                "read",
                "run",
                "play",
                "shower",
                "smile",
                "sleep",
                "stop",
                "sweep",
                "swim",
                "think",
                "throw",
                "trip",
                "walk",
                "wash",
                "write",
                "work"
              ],
    :foods => [
                "Creamed eggs on toast",
                "Deviled crab",
                "Deviled egg",
                "Domesticated turkey",
                "Doughnut",
                "Drunken chicken",
                "Eggo",
                "Eggs Benedict",
                "Eggs Neptune",
                "Energy bar",
                "Engastration",
                "Fajita",
                "Fortune cookie",
                "French dip",
                "Fried chicken",
                "Fried fish",
                "Fry sauce",
                "Frybread",
                "Garden salad",
                "German chocolate cake",
                "Goulash",
                "Greek-American cuisine",
                "Green bean casserole",
                "Grits",
                "Hamburger",
                "Hangtown fry",
                "Haystack",
                "Hog fry",
                "Home fries",
                "Hot chicken",
                "Hot chicken sandwich",
                "Ice cream cake",
                "Italian-American cuisine",
                "Italian beef",
                "Italian dressing",
                "Jell-O",
                "Jerky",
                "Juba",
                "Liver and onions",
                "Lobster Newberg",
                "Lobster roll",
                "London broil",
                "Lorna Doone",
                "Macaroni and cheese",
                "Macaroni salad",
                "Maple bacon donut",
                "Maraca pie",
                "Mashed potato",
                "Mashed pumpkin",
                "Meatcake",
                "Meatloaf",
                "Milk toast",
                "Milkshake",
                "Mission burrito",
                "Mozzarella sticks",
                "Muffuletta",
                "Mulligan stew",
                "Onion ring",
                "Oreo",
                "Oysters Rockefeller",
                "Pancakes",
                "Pasta salad",
                "Pastrami",
                "Patty",
                "Peanut butter",
                "Pemmican",
                "Pepperoni",
                "Pickled cucumber",
                "Pigs in blankets",
                "Pizza strips",
                "Ploye",
                "Pop-Tarts",
                "Popcorn",
                "Popover",
                "Poppyseed muffin",
                "Pork and beans",
                "Potato salad",
                "Potato skins",
                "Potato wedges",
                "Potatoes OBrien",
                "Protein bar",
                "Pulled pork",
                "Pumpkin pie",
                "Rabbit pie",
                "Ranch dressing",
                "Reuben sandwich",
                "Ribs",
                "Rolled oyster",
                "Russian dressing",
                "Russian tea cake",
                "Salisbury steak",
                "Sandwich",
                "Sausage gravy",
                "Scampi",
                "Scrapple",
                "Seafood cocktail",
                "Senate bean soup",
                "Slinger",
                "Sloppy joe",
                "Smelt",
                "Sonofabitch stew",
                "Soul food",
                "Sour cream",
                "Spanish rice",
                "Squab",
                "Steak",
                "Steak sandwich",
                "Steak sauce",
                "Steamed clams",
                "Stuffed ham",
                "Stuffed peppers",
                "Stuffed zucchini",
                "Succotash"
              ],
    :parts => [
                "Arm",
                "Toe",
                "Head",
                "Butt",
                "Leg",
                "Knee",
                "Nose"
              ]
  }

  def print_list
    p @word_hash
  end

  def nouns_new
    @word_hash[:nouns].sample
  end

  def names_new
    @word_hash[:names].sample
  end

  def adjectives_new
    @word_hash[:adjectives].sample
  end

  def numbers_new
    @word_hash[:numbers].sample
  end

  def verbs_new
    @word_hash[:verbs].sample
  end

  def foods_new
    @word_hash[:foods].sample
  end

  def parts_new
    @word_hash[:parts].sample
  end
end
