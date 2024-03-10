{-
-- EPITECH PROJECT, 2024
-- NQueens
-- File description:
-- Main
-}

module Main (main) where

import System.Environment
import Arguments
import Algorithm

main :: IO ()
main = do
    args <- getArgs
    n <- parseArgs args
    print $ nQueens n
