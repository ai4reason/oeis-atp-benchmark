;; sequence(s): A225773
;; terms: 2 4 6 8 9 11 13 15 18 20 22 24 25 27 29 31 34 36 38 40
;; small program: 2 + ((x - (((x div 2) div 2) mod 2)) + x)
;; fast program: 2 + ((x - ((x div (2 + 2)) mod 2)) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (- x (mod (div (div x 2) 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (- x (mod (div x (+ 2 2)) 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
