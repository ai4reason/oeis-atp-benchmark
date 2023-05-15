;; sequence(s): A47234
;; terms: 0 1 4 6 7 10 12 13 16 18 19 22 24 25 28 30 31 34 36 37
;; small program: (x - ((x mod (1 + 2)) mod 2)) + x
;; fast program: (x - (((2 - x) * x) mod (1 + 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- x (mod (mod x (+ 1 2)) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (mod (* (- 2 x) x) (+ 1 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
