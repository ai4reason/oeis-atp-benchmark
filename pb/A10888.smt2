;; sequence(s): A10888
;; terms: 0 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 1
;; small program: loop(1 + (x mod (1 + (2 * (2 + 2)))), x, 0)
;; fast program: (1 + ((x - 1) mod (1 + (2 * (2 + 2))))) * (if x <= 0 then 0 else 1)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (mod x (+ 1 (* 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (mod (- x 1) (+ 1 (* 2 (+ 2 2))))) (ite (<= x 0) 0 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
