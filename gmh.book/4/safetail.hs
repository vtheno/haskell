--
-- safetail - behaves as the library function tail, except that it maps the
-- empty list to itself.
--
module Safetail where
import Test.QuickCheck

safetail_a :: [a] -> [a]
safetail_a xs = if null xs then [] else tail' xs
        where tail' (y:ys) = ys

safetail_b :: [a] -> [a]
safetail_b xs | null xs = []
              | otherwise = tail' xs
        where tail' (y:ys) = ys

safetail_c :: [a] -> [a]
safetail_c [] = []
safetail_c (x:xs) = xs


prop_safetail_a xs = not (null xs) ==> safetail_a xs == tail xs
        where types = xs :: [Int]

prop_safetail_b xs = not (null xs) ==> safetail_b xs == tail xs
        where types = xs :: [Int]

prop_safetail_c xs = not (null xs) ==> safetail_c xs == tail xs
        where types = xs :: [Int]


runtests = do quickCheck prop_safetail_a
              quickCheck prop_safetail_b
              quickCheck prop_safetail_c
