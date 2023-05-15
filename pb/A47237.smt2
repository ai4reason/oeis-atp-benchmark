;; sequence(s): A47237
;; terms: 0 1 2 4 6 7 8 10 12 13 14 16 18 19 20 22 24 25 26 28
;; small program: ((x - ((x div 2) mod 2)) div 2) + x
;; fast program: ((x - (if (x mod (2 + 2)) <= 0 then 0 else 1)) div 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (- x (mod (div x 2) 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- x (ite (<= (mod x (+ 2 2)) 0) 0 1)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
