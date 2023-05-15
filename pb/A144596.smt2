;; sequence(s): A144596
;; terms: 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 1 0 0
;; small program: (((x div (1 + 2)) * x) mod (1 + 2)) mod 2
;; fast program: if (((2 + (x + x)) mod (1 + (2 * (2 + 2)))) - 1) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (mod (* (div x (+ 1 2)) x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (mod (+ 2 (+ x x)) (+ 1 (* 2 (+ 2 2)))) 1) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
