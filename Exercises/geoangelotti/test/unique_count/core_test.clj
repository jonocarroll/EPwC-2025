(ns unique-count.core-test
  (:require [clojure.test :refer :all]
            [unique-count.core :refer :all]))

(deftest a-test
  (testing "Unique Count"
    (is (= 4 (unique-count-set [1 3 1 4 1 5])))))
