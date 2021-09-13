import Test.Hspec
import Test.QuickCheck
import RomanNumbers (r2i, i2r)

-- A QuickCheck generator for natural number between 1 and 10000.
naturals :: Gen Int
naturals = choose (1, 10000)

main :: IO ()
main = hspec $ do
  describe "RomanNumbers" $ do
    describe "r2i" $ do

      it "should convert \"I\" to 1" $ do
        r2i "I" `shouldBe` (1::Int)

      -- Here go your own tests for r2i.
  
    describe "i2r" $ do

      it "should convert 1 to \"I\"" $ do
        i2r (1::Int) `shouldBe` "I"

      -- Here go your own tests for i2r.


-- Do not change anything below this line
--
    describe "r2i . i2r" $ do

      it "(forall n : n in N : (r2i . i2r) n >= 1)" $ property $
        forAll naturals (\n -> (r2i . i2r) n >= (1::Int))

      -- Here go your own tests for r2i . i2r.
