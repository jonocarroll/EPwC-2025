(ns unique-count.main
  (:require [unique-count.core :refer :all]))

(defn -main
  "Unique Count"
  [& args]
  (println (unique-count-set [1 3 1 4 1 5])))
