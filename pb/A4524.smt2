;; sequence(s): A4524
;; terms: 0 0 0 1 2 2 2 3 4 4 4 5 6 6 6 7 8 8 8 9
;; small program: (x - ((x div 2) mod 2)) div 2
;; fast program: (x - (if (x mod (2 + 2)) <= 0 then 0 else 1)) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (- x (mod (div x 2) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (- x (ite (<= (mod x (+ 2 2)) 0) 0 1)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
