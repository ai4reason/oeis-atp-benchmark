;; sequence(s): A203640
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1
;; small program: (loop((((y - x) div 2) - x) * y, x, 0) mod 2) + 1
;; fast program: if ((1 + x) mod (2 * (2 * (2 + 2)))) <= 0 then (if (x mod (1 + (2 + (2 + 2)))) <= 0 then 1 else 2) else 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (- (div (- y x) 2) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (mod (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ 1 x) (* 2 (* 2 (+ 2 2)))) 0) (ite (<= (mod x (+ 1 (+ 2 (+ 2 2)))) 0) 1 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
