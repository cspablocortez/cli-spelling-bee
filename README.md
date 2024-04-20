# CLI Spelling Bee

A command line interface [NYT Spelling Bee](https://www.nytimes.com/puzzles/spelling-bee) clone.

```
      CLI Spelling Bee 

              G
          I       K
              W
          R       N
              O

Found words: []
Score: 0    

> 
```

## Commands

To run a command, prepend a colon to the word at the prompt. For example: 

```
      CLI Spelling Bee 

              K
          O       N
              W
          R       I
              G
    
Found words: ["WORKING", "GROW", "GROWING", "INGROWN", "KNOW"]
Score: 30

> :shuffle
```

| Command | Function         |
|---------|------------------|
| :exit or :quit or :e or :q  | Stops all processes and safely exits the program. |
| :shuffle or :sh or ; | Shuffles outer letters. |
| :save or :s  | Saves current game progress. |
| :hide or :h  | Hides list of found words. |


## Installation

To run the app:

```bash
$ git clone https://github.com/cspablocortez/cli-spelling-bee.git
```

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
- Letters can be used more than once.
- Score points to increase your rating.
- 4-letter words are worth 1 point each.
- Longer words earn 1 point per letter.
- Each puzzle includes at least one “pangram” which uses every letter. These are worth 7 extra points!

[Source](https://www.nytimes.com/puzzles/spelling-bee)