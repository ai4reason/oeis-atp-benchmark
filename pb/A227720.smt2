;; sequence(s): A227720
;; terms: 5 16 34 57 86 121 163 210 263 322 388 459 536 619 709 804 905 1012 1126 1245
;; small program: (1 + ((2 + ((x + x) + x)) * (2 + x))) + ((1 + (x div 2)) div 2)
;; fast program: (1 + ((2 + ((x + x) + x)) * (2 + x))) + ((2 + x) div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (* (+ 2 (+ (+ x x) x)) (+ 2 x))) (div (+ 1 (div x 2)) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (* (+ 2 (+ (+ x x) x)) (+ 2 x))) (div (+ 2 x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
