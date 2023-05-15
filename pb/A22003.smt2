;; sequence(s): A22003
;; terms: 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
;; small program: (x mod (1 + 2)) div 2
;; fast program: (x - (x * x)) mod (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (mod x (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (- x (* x x)) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
