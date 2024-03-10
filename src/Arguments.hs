{-
-- EPITECH PROJECT, 2024
-- NQueens
-- File description:
-- Arguments
-}

module Arguments (
    parseArgs
) where

import System.Exit
import Text.Read

getMaybeN :: [String] -> IO (Maybe Int)
getMaybeN [s] = return (readMaybe s :: Maybe Int)
getMaybeN _ = exitWith (ExitFailure 84)

parseN :: Maybe Int -> IO Int
parseN (Just n) | n < 0 = exitWith (ExitFailure 84)
                | otherwise = return n
parseN _ = exitWith (ExitFailure 84)

parseArgs :: [String] -> IO Int
parseArgs xs = do
    mb <- getMaybeN xs
    parseN mb
