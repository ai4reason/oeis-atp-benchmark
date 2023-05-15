;; sequence(s): A171141
;; terms: 6 33 47 74 88 115 129 156 170 197 211 238 252 279 293 320 334 361 375 402
;; small program: ((1 + 2) * (2 + ((2 * ((((x mod 2) + x) + x) + x)) + x))) - (x div 2)
;; fast program: (2 + (((1 + (2 * (2 + (2 + 2)))) * ((x - (x div 2)) + x)) + x)) + (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 2) (+ 2 (+ (* 2 (+ (+ (+ (mod x 2) x) x) x)) x))) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 2 (+ (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (+ (- x (div x 2)) x)) x)) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
