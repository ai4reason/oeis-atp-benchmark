;; sequence(s): A293296
;; terms: 0 2 8 18 31 49 71 97 126 160 198 240 285 335 389 447 508 574 644 718
;; small program: (2 * (x * x)) - ((x div 2) div 2)
;; fast program: (2 * (x * x)) - (x div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* 2 (* x x)) (div (div x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* x x)) (div x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
