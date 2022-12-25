{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
import Log
import Data.List hiding (insert)


-- useful functions from prelude:
-- read, lines, words, unwords, take, drop, (.)


-- e.g.,

-- parseMessage "E 2 562 help help"
--     Log Message (Error 2) 562 "help help"

-- parseMessage "I 29 la la la"
--     LogMessage Info 29 "la la la"

-- parseMessage "This is not in the right format"
--     Unknown "This is not in the right format"


parseMessage :: String -> LogMessage
parseMessage msg = 
    let wordsOfMsg   = words msg
        code         = read (wordsOfMsg !! 1) :: Int
        code'        = read (wordsOfMsg !! 2) :: Int
        spaceIndices = elemIndices ' ' msg
        msgRmd       = (drop (spaceIndices !! 1 + 1) msg)
        msgRmd'      = (drop (spaceIndices !! 2 + 1) msg)
    in case head wordsOfMsg of
        "I" -> LogMessage Info code msgRmd
        "W" -> LogMessage Warning code msgRmd
        "E" -> LogMessage (Error code) code' msgRmd'
        _    -> Unknown msg


-- not used
extractWord :: String -> (String, String)
extractWord msg = case elemIndex ' ' msg of
    Just index -> (take index msg, drop (index+1) msg)
    Nothing    -> (msg, "")


-- parse the entire file
parse :: String -> [LogMessage]
parse msgs = map parseMessage (lines msgs)


-- expand message tree (for ordering)
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert msg Leaf = Node Leaf msg Leaf
insert msg@(LogMessage _ t _) (Node left msg'@(LogMessage _ t' _) right) =
    case t < t' of
        True -> Node (insert msg left) msg' right
        False -> Node left msg' (insert msg right)
insert _ tree = tree


-- build the message tree from list
build :: [LogMessage] -> MessageTree
build msgs = continueBuilding msgs Leaf

continueBuilding :: [LogMessage] -> MessageTree -> MessageTree
continueBuilding [] tree = tree
continueBuilding (msg: msgs) tree = continueBuilding msgs (insert msg tree)


-- get ordered list back
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left msg right) = inOrder left ++ [msg] ++ inOrder right


-- I don't actually know how to test this yet, since the testParse method
-- returns an IO list... so need to learn how IO works
