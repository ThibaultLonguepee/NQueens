{-
-- EPITECH PROJECT, 2024
-- NQueens
-- File description:
-- Generator
-}

module Generator (
    generateQueenRow,
    generateRowsOfSize
) where

import Datatypes

generateQueenRow :: Size -> Pos -> Row
generateQueenRow 0 _ = []
generateQueenRow s 0 = 1:(generateQueenRow (s - 1) (-1))
generateQueenRow s p = 0:(generateQueenRow (s - 1) (p - 1))

rowGenerator :: Size ->  Pos -> [Row]
rowGenerator s p
    | s == p = []
    | otherwise = (generateQueenRow s p):(rowGenerator s (p + 1))

generateRowsOfSize :: Size -> [Row]
generateRowsOfSize s = rowGenerator s 0
