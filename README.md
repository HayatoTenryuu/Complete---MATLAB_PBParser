# <ins> Sample Program </ins>

### Purpose: 
This is just to try out web scraping and analyzing scraped data all using MATLAB.
This sort of operation has some interesting and useful functions that I would like
to remember how to use for later projects.

### Goal:
Literally none. But if this bore any fruit, that would be interesting too.

### About the game:
There are four sets of white balls, and 4 sets of red balls. One set of each is randomly selected before each drawing.
Within each set of white balls, you have ball numbers 1-69. Within each set of red balls, you have ball numbers 1-26.
You select an exclusive set of 5 white ball numbers (aka no repeating numbers) and a single red ball number.
The red ball number can be the same as a white ball number. The goal is to match what is drawn; ball order is not a factor.

Based on how many balls you match with the drawing, you win different prizes. There are also multipliers for certain tiers,
but if you can't match anything, it's a waste of money. Winnings follow these rules:

1. Match ONLY the red ball (powerball):             You get $4. Multipliers up to 10x take effect.
2. Match ONE white ball AND the red ball:           You get $4. Multipliers up to 10x take effect.
3. Match TWO white balls AND the red ball:          You get $7. Multipliers up to 10x take effect.
4. Match THREE white balls:                         You get $7. Multipliers up to 10x take effect.
5. Match THREE white balls AND the red ball:        You get $100. Multipliers up to 10x take effect.
6. Match FOUR white balls:                          You get $100. Multipliers up to 10x take effect.
7. Match FOUR white balls AND the red ball:         You get $50,000. Multipliers up to 10x take effect.
8. Match ALL FIVE white balls:                      You get $1,000,000. Multipliers up to 2x take effect, others default to 2x.
9. Match ALL FIVE white balls AND the red ball:     You get the Grand Prize (starts at $20 million).

### How to use this project:
1. Download all the files, obviously. Put them in a dedicated folder,
    as this will become your working folder.
2. Run either App.mlapp or main.m - they are both the same thing.
3. Click the buttons in order from top to bottom, making sure they finish
    before you click the next one. Also make sure you have internet. The first
    step is to download some reference data, after all.
4. Once the last step is complete, take your numbers and buy a powerball ticket.
5. Optional step, but it exists if you want it - you can see what kind of pattern the previous numbers fell as
    by opening the "figure\Powerball stats.xlsx" file. Numbers with a 1 next to them were the previous winning
    numbers, and columns are ordered by likely-medium-unlikely.