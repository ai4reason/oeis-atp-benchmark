;; sequence(s): A92200
;; terms: 1 3 3 4 6 6 7 9 9 10 12 12 13 15 15 16 18 18 19 21
;; small program: 1 + (((x mod (1 + 2)) mod 2) + x)
;; fast program: (if ((2 + x) mod (1 + 2)) <= 0 then 2 else 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (mod (mod x (+ 1 2)) 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (mod (+ 2 x) (+ 1 2)) 0) 2 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
