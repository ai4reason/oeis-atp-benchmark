;; sequence(s): A3879
;; terms: 1 3 3 6 7 8
;; small program: 1 + ((if (x - 2) <= 0 then (x mod 2) else 2) + x)
;; fast program: 1 + (if (x - 2) <= 0 then (if x <= 0 then 0 else 2) else (x + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (ite (<= (- x 2) 0) (mod x 2) 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (ite (<= (- x 2) 0) (ite (<= x 0) 0 2) (+ x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
