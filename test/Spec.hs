import Test.Hspec
import Test.QuickCheck
import RomanNumbers (r2i, i2r)
import Control.Exception (evaluate)

-- A QuickCheck generator for natural number between 1 and 10000.
naturals :: Gen Int
naturals = choose (1, 10000)

main :: IO ()
main = hspec $ do
  describe "RomanNumbers" $ do
    describe "r2i" $ do

      it "should convert \"I\" to 1" $ do
        r2i "I" `shouldBe` (1::Int)

      it "should convert \"X\" to 10" $ do
        r2i "X" `shouldBe` (10::Int)

      it "should convert \"M\" to 1000" $ do
        r2i "M" `shouldBe` (1000::Int)

      it "should convert \"XIIII\" to 14" $ do
        r2i "XIIII" `shouldBe` (14::Int)
      
      it "should convert \"VI\" to 6" $ do
        r2i "VI" `shouldBe` (6::Int)

      it "should convert \"\" to 0" $ do
        r2i "" `shouldBe` (0::Int)

      it "should convert \"P\" to error" $ do
        evaluate (r2i "P") `shouldThrow` anyErrorCall
  
    describe "i2r" $ do

      it "should convert 1 to \"I\"" $ do
        i2r (1::Int) `shouldBe` "I"

      it "should convert 10 to \"X\"" $ do
        i2r (10::Int) `shouldBe` "X"
      
      it "should convert 15 to \"XV\"" $ do
        i2r (15::Int) `shouldBe` "XV"

      it "should convert 1000 to \"M\"" $ do
        i2r (1000::Int) `shouldBe` "M"

      it "should convert 0 to \"\"" $ do
        i2r (0::Int) `shouldBe` ""

      it "should convert -10 to error" $ do
        evaluate (i2r ((-10)::Int)) `shouldThrow` anyErrorCall




-- Do not change anything below this line
--
    describe "r2i . i2r" $ do

      it "(forall n : n in N : (r2i . i2r) n >= 1)" $ property $
        forAll naturals (\n -> (r2i . i2r) n >= (1::Int))

      it "(forall n : n in N : (r2i . i2r) n >= n)" $ property $
        forAll naturals (\n -> (r2i . i2r) n == n)

      -- Here go your own tests for r2i . i2r.
