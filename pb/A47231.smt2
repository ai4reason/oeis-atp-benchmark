;; sequence(s): A47231
;; terms: 0 3 4 6 9 10 12 15 16 18 21 22 24 27 28 30 33 34 36 39
;; small program: (((x mod (1 + 2)) mod 2) + x) + x
;; fast program: ((((2 - x) * x) mod (1 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (mod (mod x (+ 1 2)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (mod (* (- 2 x) x) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
