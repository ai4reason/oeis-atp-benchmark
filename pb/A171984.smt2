;; sequence(s): A171984
;; terms: 4 8 12 16 20 24 28 32 37 41 45 49 53 57 61 65 70 74 78 82
;; small program: (2 * (2 + (x + x))) + (((x div 2) div 2) div 2)
;; fast program: (2 * (2 + (x + x))) + (x div (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ 2 (+ x x))) (div (div (div x 2) 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ 2 (+ x x))) (div x (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
