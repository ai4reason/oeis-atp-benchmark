;; sequence(s): A80460
;; terms: 2 2 6 10 14 14 18 22 26 26 30 34 38 38 42 46 50 50 54 58
;; small program: 2 + (2 * (2 * (((x div 2) + x) div 2)))
;; fast program: 2 + ((((x mod (0 - (2 + 2))) + x) + x) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (* 2 (* 2 (div (+ (div x 2) x) 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (+ (mod x (- 0 (+ 2 2))) x) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
