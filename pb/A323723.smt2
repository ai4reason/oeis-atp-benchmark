;; sequence(s): A323723
;; terms: 0 0 4 14 32 64 108 174 256 368 500 670 864 1104 1372 1694 2048 2464 2916 3438
;; small program: (((1 + (x * x)) div 2) * x) - (x mod 2)
;; fast program: (((1 + (x * x)) div 2) * (x - 2)) + (x * x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (div (+ 1 (* x x)) 2) x) (mod x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (div (+ 1 (* x x)) 2) (- x 2)) (* x x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
