# CLI Spelling Bee

A command line interface [NYT Spelling Bee](https://www.nytimes.com/puzzles/spelling-bee) clone.

```
      CLI Spelling Bee 

              G
          I       K
              W
          R       N
              O
    
Found words: ["OWNING", "GROWING", "KNOWING", "WINK"]
Score: 20

> 
```

## Instructions

To run the app:

```bash
$ bundle install
```

```bash
$ ruby app.rb
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

## Gameplay

To run a command, prepend a colon to the word at the prompt. For example: 

```
      CLI Spelling Bee 

              G
          I       K
              W
          R       N
              O
    
Found words: []
Score: 0

> :shuffle
```

| Command | Function         |
|---------|------------------|
| :exit   | This command stops all processes and safely exits the program. |
| :shuffle| Shuffle the order of the outer letters. |
