;; sequence(s): A345021
;; terms: 0 1 0 1 1 2 1 2 0 1 0 1 1 2 1 2 0 1 0 1
;; small program: (((x div 2) div 2) mod 2) + (x mod 2)
;; fast program: ((x div (2 + 2)) mod 2) + (x mod 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (mod (div (div x 2) 2) 2) (mod x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (mod (div x (+ 2 2)) 2) (mod x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
