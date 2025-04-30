(ns smallest-two.main
  (:require [smallest-two.core :refer :all]))

(defn -main
  "Smallest Two"
  [& args]
  (println (smallest-two-set [1 -1 1 4 1 0])))
