;; sequence(s): A300293
;; terms: 0 0 1 1 1 2 3 3 4 4 4 5 6 6 7 7 7 8 9 9
;; small program: (x - ((x div (1 + 2)) mod 2)) div 2
;; fast program: (x - (((2 - x) * x) mod (1 + 2))) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (- x (mod (div x (+ 1 2)) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (- x (mod (* (- 2 x) x) (+ 1 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
