(ns smallest-two.core)

(defn smallest-two [arr]
  (take 2 (sort arr)))
