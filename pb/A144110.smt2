;; sequence(s): A144110
;; terms: 2 2 2 1 1 1 2 2 2 1 1 1 2 2 2 1 1 1 2 2
;; small program: 2 - ((x div (1 + 2)) mod 2)
;; fast program: if ((x mod (2 + (2 + 2))) - 2) <= 0 then 2 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- 2 (mod (div x (+ 1 2)) 2)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (mod x (+ 2 (+ 2 2))) 2) 0) 2 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
