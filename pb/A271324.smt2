;; sequence(s): A271324
;; terms: 0 2 4 6 5 7 9 11 10 12 14 16 15 17 19 21 20 22 24 26
;; small program: (((x div 2) div 2) + (x mod (2 + 2))) + x
;; fast program: (x - ((1 + 2) * (x div (2 + 2)))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (div x 2) 2) (mod x (+ 2 2))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (* (+ 1 2) (div x (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
