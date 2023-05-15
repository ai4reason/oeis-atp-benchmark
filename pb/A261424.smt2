;; sequence(s): A261424
;; terms: 0 0 0 0 0 0 0 0 0 0 1 0 1 2 3 4 5 6 7 8
;; small program: (loop(((if ((x div (2 + (2 * (2 + 2)))) * (x mod loop(1 + (x + x), 2, 2))) <= 0 then 1 else 0) - 1) + x, x, x) * (0 - 1)) + x
;; fast program: loop((loop(((if ((x div (2 + (2 * (2 + 2)))) * (x mod (1 + (2 + (2 * (2 + 2)))))) <= 0 then 1 else 0) - 1) + x, x mod (1 + (2 + (2 * (2 + 2)))), x) - x) - x, 2, x) - x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 1 (+ x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (- (ite (<= (* (div x (+ 2 (* 2 (+ 2 2)))) (mod x v1)) 0) 1 0) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) (- 0 1)) x))))
(assert (forall ((x Int)) (= (f3 x) (+ (- (ite (<= (* (div x (+ 2 (* 2 (+ 2 2)))) (mod x (+ 1 (+ 2 (* 2 (+ 2 2)))))) 0) 1 0) 1) x))))
(assert (forall ((x Int)) (= (g3 x) (mod x (+ 1 (+ 2 (* 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (- (v3 x) x) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v2 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
