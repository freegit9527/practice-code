/*
 * =====================================================================================
 *       Filename : blackjack.h
 *    Description : 
 *        Created : 05/06/14 23:19
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : How about today?
 * =====================================================================================
 */


#ifndef _BLACKJACK_H_
# define _BLACKJACK_H_

/* Total number of cards */
# define NUMBER_CARDS (NUMBER_SUITS * NUMBER_RANKS)

/* Number of rounds before shuffling. Should not be higher than 6. */
# define NUMBER_ROUNDS_SHUFFLE 6

/* Maximum of cards possible in a hand (4 aces, 4 twos, 3 threes) */
# define MAXIMUM_HAND 11

/* Suit */
typedef enum
{
    /* Spade, heart, diamond and club */
    SPADE = 0,
    HEART,
    DIAMOND,
    CLUB,

    /* Number of suits */
    NUMBER_SUITS

} Suit;

/* Rank
 *
 * These ranks do not correspond to
 * the actual value within the game.
 */
typedef enum
{
    ACE = 0,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX,
    SEVEN,
    EIGHT,
    NINE,
    TEN,
    JACK,
    QUEEN,
    KING,

    /* Number of ranks */
    NUMBER_RANKS

} Rank;

/* A card */
typedef struct
{
    /* Card suit */
    Suit suit;

    /* Card rank */
    Rank rank;

} Card;

/* Unsigned integer */
typedef unsigned int uint;

#endif /* _BLACKJACK_H_ */