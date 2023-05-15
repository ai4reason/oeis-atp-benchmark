;; sequence(s): A222254
;; terms: 0 1 2 3 4 5 6 7 9 8 10 11 12 13 14 15 16 17 19 18
;; small program: ((((1 + x) mod (1 + (2 + 2))) - (x mod 2)) div (2 + 2)) + x
;; fast program: ((((1 + x) mod (2 + (2 * (2 + 2)))) - 1) div (2 * (2 + 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (- (mod (+ 1 x) (+ 1 (+ 2 2))) (mod x 2)) (+ 2 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (mod (+ 1 x) (+ 2 (* 2 (+ 2 2)))) 1) (* 2 (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
