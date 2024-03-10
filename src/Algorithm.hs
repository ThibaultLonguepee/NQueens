{-
-- EPITECH PROJECT, 2024
-- NQueens
-- File description:
-- Algorithm
-}

module Algorithm (
    nQueens
) where

import Datatypes
import Generator

compareWithShift :: Row -> Row -> Int -> Bool
compareWithShift [] [] _ = True
compareWithShift (x:xs) (y:ys) 0
    | x == y = compareWithShift xs ys 0
    | otherwise = False
compareWithShift x y s = compareWithShift x (0:(take len y)) (s - 1)
    where len = (length y) - 1

-- Checks if two row may overlapp
compareRowOverlapp :: Row -> Row -> Int -> Bool
compareRowOverlapp a b c =
    compareWithShift a b c ||
    compareWithShift b a c ||
    compareWithShift b a 0

boardRowComparer :: [Row] -> Row -> Pos -> Bool
boardRowComparer _ _ 0 = True
boardRowComparer [] _ _ = True
boardRowComparer (x:xs) r i
    | (compareRowOverlapp x r i) = False
    | otherwise = boardRowComparer xs r (i - 1)

isValidRow :: Board -> Row -> Bool
isValidRow [] _ = True
isValidRow b r = boardRowComparer b r (length b)

getValidRows :: Board -> [Row] -> [Row]
getValidRows _ [] = []
getValidRows b (x:xs)
    | isValidRow b x = x:(getValidRows b xs)
    | otherwise = getValidRows b xs

draftNextValidMoves :: Board -> [Row]
draftNextValidMoves b = getValidRows b $ generateRowsOfSize len
    where len = length $ head b

packNewBoards :: Board -> [Row] -> [Board]
packNewBoards _ [] = []
packNewBoards b (x:xs) = (b ++ [x]):(packNewBoards b xs)

getNextBoards :: Board -> [Board]
getNextBoards b = packNewBoards b $ draftNextValidMoves b

countNextBoards :: [Board] -> Depth -> Int
countNextBoards b 1 = length b
countNextBoards [] _ = 0
countNextBoards (x:xs) d =
    (countNextBoards (getNextBoards x) (d - 1)) + (countNextBoards xs d)

nQueens :: Size -> Int
nQueens n = countNextBoards (packNewBoards [] $ generateRowsOfSize n) n
