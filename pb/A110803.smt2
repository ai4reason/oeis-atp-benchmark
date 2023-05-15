;; sequence(s): A110803
;; terms: 1 2 3 4 5 6 7 8 9 20 22 24 26 28 30 32 34 36 38 40
;; small program: (if ((x div (1 + 2)) - 2) <= 0 then 1 else (2 + x)) + x
;; fast program: (if (x - (2 * (2 + 2))) <= 0 then 1 else (2 + x)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (- (div x (+ 1 2)) 2) 0) 1 (+ 2 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (- x (* 2 (+ 2 2))) 0) 1 (+ 2 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
