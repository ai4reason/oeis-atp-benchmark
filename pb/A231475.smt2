;; sequence(s): A231475
;; terms: 4 3 4 3 4 1 4 3 4 3 4 1 4 3 4 3 4 1 4 3
;; small program: ((((x - (x mod (2 + (x mod 2)))) div 2) + 2) * 2) - x
;; fast program: ((if ((1 + x) mod (2 + (2 + 2))) <= 0 then 0 else 2) - (x mod 2)) + 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (+ (div (- x (mod x (+ 2 (mod x 2)))) 2) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (ite (<= (mod (+ 1 x) (+ 2 (+ 2 2))) 0) 0 2) (mod x 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
