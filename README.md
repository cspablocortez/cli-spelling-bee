# CLI Spelling Bee

A [NYT Spelling Bee](https://www.nytimes.com/puzzles/spelling-bee) clone.

## Instructions

To run the app:

```bash
bundle install
```

```bash
ruby app.rb
```

## How to Play Spelling Bee

- Create words using letters from the hive.
- Words must contain at least 4 letters.
- Words must include the center letter.
- Our word list does not include words that are obscure, hyphenated, or proper nouns.
- No cussing either, sorry.
- Letters can be used more than once.
- Score points to increase your rating.
- 4-letter words are worth 1 point each.
- Longer words earn 1 point per letter.
- Each puzzle includes at least one “pangram” which uses every letter. These are worth 7 extra points!

[Source](https://www.nytimes.com/puzzles/spelling-bee)

To run commands, prepend a colon to the words:

| Command | Function         |
|---------|------------------|
| :exit   | This command stops all processes and safely exits the program. |
| :shuffle| Shuffle the order of the outer letters. |

