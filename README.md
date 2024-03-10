# NQueens
The NQueens project aims to deliver an Haskell-built solution to the N-Queens problem.

## The problem
The N-Queens problem is a variation of the original Eight Queens problem.
In the original problem, we are asked to count the amount of ways you can place eight chess queen pieces on a chessboard, without any of them being able to capture any on the next turn.
Here's an example solution:
![A possible solution to the Eight Queens problem.](https://static.miraheze.org/rosettacodewiki/b/bd/N_queens_problem.png)
The N-Queens alternative means we are essentially solving the same problem but for any given amount of queen, on a scalable chessboard.
Solving for N queens means:
> Finding the amount of arrangements of N queens on an N by N chessboard, such as no queen can capture another on the next turn.

## Usage
### Pre-requeries
- Having `stack` installed
### Steps
1) Clone or Download this repository.
2) Inside the source folder, execute the following: `make`.
3) Run using `./nQueens N` with `N` as the queens count and board size.
