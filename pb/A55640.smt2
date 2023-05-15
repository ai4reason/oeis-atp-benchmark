;; sequence(s): A55640
;; terms: 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2
;; small program: ((((1 + (x mod (2 + (2 * (2 + 2))))) mod (1 + x)) + x) + x) div (1 + x)
;; fast program: if (((1 + (x mod (2 + (2 * (2 + 2))))) mod (1 + x)) - 1) <= 0 then (if x <= 0 then 0 else 1) else 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (+ (mod (+ 1 (mod x (+ 2 (* 2 (+ 2 2))))) (+ 1 x)) x) x) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (mod (+ 1 (mod x (+ 2 (* 2 (+ 2 2))))) (+ 1 x)) 1) 0) (ite (<= x 0) 0 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
