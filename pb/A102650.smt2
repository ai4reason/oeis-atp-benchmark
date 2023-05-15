;; sequence(s): A102650
;; terms: 4 12 28 56 116 236 476 952 1908 3820 7644 15288 30580 61164 122332 244664 489332 978668 1957340 3914680
;; small program: loop(((if (y mod (2 + 2)) <= 0 then 0 else 2) + x) * 2, 1 + x, 0)
;; fast program: ((((loop(x * x, 1, loop(x + x, x div 2, 2)) * (1 + (x mod 2))) * (1 + (2 + (2 + 2)))) div ((2 * (2 * (2 + 2))) - 1)) * 2) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (ite (<= (mod y (+ 2 2)) 0) 0 2) x) 2))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) (div x 2))))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (h1 x) (v2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (* (div (* (* (v1 x) (+ 1 (mod x 2))) (+ 1 (+ 2 (+ 2 2)))) (- (* 2 (* 2 (+ 2 2))) 1)) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
