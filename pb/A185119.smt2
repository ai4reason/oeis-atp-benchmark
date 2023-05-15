;; sequence(s): A185119
;; terms: 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
;; small program: ((2 - (x div (1 + 2))) div (2 + x)) mod 2
;; fast program: if (x - (2 * (2 + 2))) <= 0 then (if x <= 0 then 1 else 0) else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (div (- 2 (div x (+ 1 2))) (+ 2 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- x (* 2 (+ 2 2))) 0) (ite (<= x 0) 1 0) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
