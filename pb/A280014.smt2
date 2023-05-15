;; sequence(s): A280014
;; terms: 12 18 22 28 42 48 52 58 72 78 82 88 102 108 112 118 132 138 142 148
;; small program: (((2 + (((x div 2) div 2) + x)) * (1 + 2)) - ((x div 2) mod 2)) * 2
;; fast program: (((2 + ((2 * (x div (2 + 2))) + x)) * ((2 + 1) + 2)) + (x mod 2)) + 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (- (* (+ 2 (+ (div (div x 2) 2) x)) (+ 1 2)) (mod (div x 2) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ 2 (+ (* 2 (div x (+ 2 2))) x)) (+ (+ 2 1) 2)) (mod x 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
