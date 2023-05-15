;; sequence(s): A291171
;; terms: 2 4 6 8 10 11 13 15 17 20 22 24 26 28 29 31 33 35
;; small program: 2 + ((x - (((x + x) mod (1 + (2 * (2 + 2)))) mod 2)) + x)
;; fast program: ((if (((x mod (1 + (2 * (2 + 2)))) - 2) - 2) <= 0 then 2 else 1) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (- x (mod (mod (+ x x) (+ 1 (* 2 (+ 2 2)))) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (ite (<= (- (- (mod x (+ 1 (* 2 (+ 2 2)))) 2) 2) 0) 2 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
