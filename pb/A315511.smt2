;; sequence(s): A315511
;; terms: 1 6 11 17 21 27 32 38 44 49 55 59 65 70 76 82 87 93 97 103
;; small program: ((((((((1 + ((x div (1 + (2 + (2 + 2)))) + x)) div (if x <= 0 then 1 else 2)) + x) + x) * (2 + 2)) + 1) div (1 + 2)) + x) + x
;; fast program: (((((((((1 + (2 + (2 * (x + x)))) div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else x)) + x) * 2) * 2) + 1) div (1 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (* (+ (+ (div (+ 1 (+ (div x (+ 1 (+ 2 (+ 2 2)))) x)) (ite (<= x 0) 1 2)) x) x) (+ 2 2)) 1) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* (* (+ (+ (div (+ 1 (+ 2 (* 2 (+ x x)))) (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 x)) x) 2) 2) 1) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
