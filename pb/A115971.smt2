;; sequence(s): A115971-A320007
;; terms: 0 1 0 1 1 1 1 1 0 1 0 1 1 1 1 1 0 1 0 1
;; small program: ((if (x mod 2) <= 0 then (x div 2) else 2) div 2) mod 2
;; fast program: if (((2 - x) * x) mod (2 * (2 * (2 + 2)))) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (div (ite (<= (mod x 2) 0) (div x 2) 2) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (* (- 2 x) x) (* 2 (* 2 (+ 2 2)))) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
