;; sequence(s): A92278
;; terms: 0 0 0 0 1 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3
;; small program: (1 + (((x div 2) + x) div 2)) div (2 + 2)
;; fast program: ((2 * (2 + x)) + x) div (2 * (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 1 (div (+ (div x 2) x) 2)) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* 2 (+ 2 x)) x) (* 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
