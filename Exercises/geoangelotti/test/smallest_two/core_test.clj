(ns smallest-two.core-test
  (:require [clojure.test :refer :all]
            [smallest-two.core :refer :all]))


(deftest a-test
  (testing "Smallest Two"
    (is (= [-1 0] (smallest-two [1 -1 1 4 1 0])))))
