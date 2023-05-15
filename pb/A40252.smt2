;; sequence(s): A40252
;; terms: 16 2 2 32 2 2 32 2 2 32 2 2 32 2 2 32 2 2 32 2
;; small program: (if (x mod (1 + 2)) <= 0 then loop(x * x, 2, 2) else 1) * (if x <= 0 then 1 else 2)
;; fast program: loop(2 * (2 * (2 * (x + x))), 1 - (x mod (1 + 2)), if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (ite (<= (mod x (+ 1 2)) 0) v0 1) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (f1 x) (* 2 (* 2 (* 2 (+ x x)))))))
(assert (forall ((x Int)) (= (g1 x) (- 1 (mod x (+ 1 2))))))
(assert (forall ((x Int)) (= (h1 x) (ite (<= x 0) 1 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)