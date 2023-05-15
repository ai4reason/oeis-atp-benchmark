;; sequence(s): A64995-A329994
;; terms: 2 4 7 9 12 14 17 19 22 24 27 29 31 34 36 39 41 44 46 49
;; small program: 2 + ((((x - (((x div 2) div 2) div (1 + 2))) div 2) + x) + x)
;; fast program: 2 + ((((x - (x div (2 * (2 + (2 + 2))))) div 2) + x) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (div (- x (div (div (div x 2) 2) (+ 1 2))) 2) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (div (- x (div x (* 2 (+ 2 (+ 2 2))))) 2) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
