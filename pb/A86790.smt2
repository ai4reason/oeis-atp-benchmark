;; sequence(s): A86790
;; terms: 1 2 4 8 11 15 19 23 26 30 34 38 42 46 50 54 58 62 66 70
;; small program: (1 + (2 * (2 * ((x * x) - (x div 2))))) div (1 + x)
;; fast program: (2 + (2 * ((2 * (x * x)) - x))) div ((if x <= 0 then 2 else 1) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 1 (* 2 (* 2 (- (* x x) (div x 2))))) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ 2 (* 2 (- (* 2 (* x x)) x))) (+ (ite (<= x 0) 2 1) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
